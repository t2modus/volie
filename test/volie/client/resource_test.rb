# frozen_string_literal: true

require 'test_helper'

module Volie
  module Client
    # This class is responsible for testing the resource class
    class ResourceTest < Minitest::Test
      # for purposes of testing, we need to monkey patch Resource to return a permitted set of
      # valid key
      # rubocop:disable Style/ClassAndModuleChildren
      class ::Volie::Client::Resource
        VALID_KEYS = %i[test_key hello goodbye].freeze
      end
      # rubocop:enable Style/ClassAndModuleChildren

      def test_initialize_sets_up_attr_accessor_methods_for_all_attributes
        resource = Resource.new(test_key: 'test_value')
        assert_equal 'test_value', resource.test_key
        assert_equal 'test_value', resource.instance_variable_get('@attributes')[:test_key]
        resource.test_key = 'new_test_value'
        assert_equal 'new_test_value', resource.test_key
        assert_equal 'new_test_value', resource.instance_variable_get('@attributes')[:test_key]
      end

      def test_post_sends_a_post_request_to_the_given_url_with_auth_parameters_attached
        stub_request(:post, 'https://app.volie.io/api/v1/made_up_url?access_key=fake&secret_key=faker')
          .to_return(body: '{"message": "Success"}')
        use_default_configuration
        assert_equal({ 'message' => 'Success' }, Resource.post(path: 'made_up_url', parameters: {}))
      end

      def test_two_instances_are_equal_if_their_attributes_are_equal
        assert_equal Resource.new(hello: 'goodbye'), Resource.new(hello: 'goodbye')
        refute Resource.new(hello: 'goodbye') == Resource.new(goodbye: 'hello')
      end

      def test_auth_params_returns_valid_auth_credentials_based_on_the_configuration
        assert_equal({ access_key: nil, secret_key: nil }, Resource.auth_params)
        use_default_configuration
        assert_equal({ access_key: 'fake', secret_key: 'faker' }, Resource.auth_params)
      end

      # TODO: write test to make sure that a passed in config and a defualt config
      # that have the same credentials will return the same result
      def test_passed_in_configuration_works_the_same_as_default_configuration
        ENV['VOLIE_ACCESS_KEY'] = "access"
        ENV['VOLIE_SECRET_KEY'] = "secret"
        use_default_configuration
        new_configuration


      end

      def test_post_will_not_post_if_not_configured
        # since we're running webmock, any actual HTTP requests made would raise an error
        configuration = Volie::Client::Configuration.new
        configuration.stubs(:valid).returns(false)
        assert_raises ::Volie::Client::Error do
          Resource.post(path: 'made_up_path', parameters: {})
        end
      end

      def test_handle_response_returns_loaded_json_if_request_is_successful
        response = OpenStruct.new(code: 200, body: '{ "message": "success" }')
        assert_equal({ 'message' => 'success' }, Resource.handle_response(response, [200]))
      end

      def test_handle_response_raises_an_error_if_request_is_not_successful
        response = OpenStruct.new(code: 400, body: '{ "message": "failure" }')
        assert_raises ::Volie::Client::Error do
          Resource.handle_response(response, [200])
        end
      end

      def test_define_rest_actions_defines_rest_class_methods
        %i[list create find].each do |method|
          refute Resource.methods.include?(method)
        end
        Resource.define_rest_actions(:test, only: :list)
        assert Resource.methods.include?(:list)
        refute Resource.methods.include?(:find)
        refute Resource.methods.include?(:create)
        Resource.define_rest_actions(:test, except: :create)
        assert Resource.methods.include?(:list)
        assert Resource.methods.include?(:find)
        refute Resource.methods.include?(:create)
        Resource.define_rest_actions(:test)
        %i[list create find].each do |method|
          assert Resource.methods.include?(method)
        end
      end
    end
  end
end
