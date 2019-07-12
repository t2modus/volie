# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding Customer objects, and
    # for representing customer objects once received. It's also
    # responsible for representing customer objects and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST api rather than a database.
    class Customer < Resource
      VALID_KEYS = %i[address_1 address_2 cell_phone cell_phone_dnc_flag city_region created_at customer_key
                      deleted_at dnc_at do_not_contact_flag email_address_1 email_address_2 first_name
                      full_name home_phone home_phone_dnc_flag last_name lat_lng latitude longitude
                      middle_name organization_key postal_code state_province time_zone updated_at
                      work_phone work_phone_dnc_flag].freeze
      define_rest_actions :customer, except: :create

      # Overriding this method here so we can fix the problem with
      # state_province being sent as get_customers instead
      def transform_params(params)
        if params['get_customers'] && !params['state_province']
          params.merge('state_province' => params['get_customers'])
        else
          params
        end
      end

      def update(attributes = {}, configuration = nil)
        self.class.new self.class.post(path: 'update_customer', parameters: @attributes.merge(attributes), configuration: configuration)
      end

      def destroy
        self.class.validate_configured!
        response = HTTP.post(
          self.class.request_url(path: 'destroy_customer'),
          params: { customer_key: self.customer_key }
        )
        response.code == 200 && response.body.to_s == 'OK'
      end

      class << self
        def find_or_create_by(attributes, configuration = nil)
          new post(path: 'match_or_create_customer', parameters: attributes, configuration: configuration)
        end
      end
    end
  end
end
