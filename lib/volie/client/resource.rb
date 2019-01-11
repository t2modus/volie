# frozen_string_literal: true

require 'http'
require 'multi_json'

module Volie
  module Client
    # This class is intended as a superclass
    # to all other resources (organizations, campaigns, etc)
    # It will implement the basic HTTP functionality
    # and provide an interface for the rest of the subclasses
    # to inherit from
    class Resource
      BASE_URL = 'https://app.volie.io/api/v1'
      attr_reader :attributes

      def initialize(attributes)
        @attributes = self.class
                          .empty_instance_hash
                          .merge(
                            attributes.transform_keys(&method(:substitute_numbers))
                                      .symbolize_keys
                                      .slice(*self.class.valid_keys)
                          )
                          .with_indifferent_access
        self.define_attr_accessors
      end

      # This method is stupid. It's only necessary because
      # literally ALL of Volie's documentation lists the fields
      # as address_1, email_address_2, etc, but they're sending back
      # address_one, email_address_two, etc
      def substitute_numbers(key)
        key.gsub('_one', '_1').gsub('_two', '_2')
      end

      def define_attr_accessors
        return if @attributes.blank?
        @attributes.each_key do |attribute|
          define_singleton_method(attribute) { @attributes[attribute] }
          define_singleton_method("#{attribute}=") { |v| @attributes[attribute] = v }
        end
      end

      # We need some way of comparing equality of these instances for testing purposes
      def ==(other)
        @attributes == other.instance_variable_get('@attributes')
      end

      def ===(other)
        self.==(other)
      end

      class << self
        def auth_params
          {
            access_key: Configuration.instance.access_key,
            secret_key: Configuration.instance.secret_key
          }
        end

        def request_url(path:)
          path = path[1..-1] while path.start_with?('/')
          "#{BASE_URL}/#{path}"
        end

        def handle_response(response, success_codes = [200])
          succeeded = success_codes.include? response.code
          raise Error, "Received an error (#{response.code}) from the Volie Servers: #{response.body}" unless succeeded
          MultiJson.load(response.body.to_s)
        end

        def post(path:, parameters:)
          validate_configured!
          handle_response HTTP.post(request_url(path: path), params: parameters.merge(auth_params))
        end

        def validate_configured!
          error_message = 'Volie must be configured with a valid API access key and secret key before use.'
          raise Error, error_message unless Configuration.instance.valid?
        end

        def should_define_rest_action?(action, options)
          options[:except] = [options[:except]].flatten.compact
          options[:only] = [options[:only]].flatten.compact
          !(
            options[:except].map(&:to_s).include?(action.to_s) ||
            (!options[:only].empty? && !options[:only].map(&:to_s).include?(action.to_s))
          )
        end

        def define_rest_actions(resource_name, opts = {})
          params = opts.with_indifferent_access

          if should_define_rest_action?(:list, params)
            define_singleton_method :list do |options = {}|
              post(path: "get_#{resource_name.to_s.pluralize}", parameters: options).map(&method(:new))
            end
          end

          if should_define_rest_action?(:find, params)
            define_singleton_method :find do |resource_key|
              new post(path: "find_#{resource_name}", parameters: { "#{resource_name}_key" => resource_key })
            end
          end

          # Deliberately not using a guard clause here to match the style of the rest of the method
          # rubocop:disable Style/GuardClause
          if should_define_rest_action?(:create, params)
            define_singleton_method :create do |attributes|
              new post(path: "create_#{resource_name}", parameters: attributes)
            end
          end
          # rubocop:enable Style/GuardClause
        end

        def valid_keys
          self::VALID_KEYS
        end

        def empty_instance_hash
          valid_keys.map { |k| [k, nil] }.to_h
        end
      end
    end
  end
end
