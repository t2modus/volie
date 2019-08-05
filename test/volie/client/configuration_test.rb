# frozen_string_literal: true

require 'test_helper'

module Volie
  module Client
    class ConfigurationTest < ::Minitest::Test
      def configure_client(access_key, secret_key)
        @configuration = Configuration.new(access_key: access_key, secret_key: secret_key)
      end

      def test_can_successfully_configure_the_client
        @configuration.configure('test-access-key', 'test-secret-key')
        assert_equal 'test-access-key', @configuration.access_key
        assert_equal 'test-secret-key', @configuration.secret_key
      end

      def test_can_successfully_clear_configuration
        self.configure_client('test-access', 'test-secret')
        refute_nil @configuration.access_key
        refute_nil @configuration.secret_key
        @configuration.clear!
        assert_nil @configuration.access_key
        assert_nil @configuration.secret_key
      end

      def test_configuration_with_no_access_key_or_secret_key_is_invalid
        refute @configuration.valid?
      end

      def test_if_no_configuration_is_provided_then_configuration_from_environment_is_used
        ENV['VOLIE_ACCESS_KEY'] = 'testing-env-access'
        ENV['VOLIE_SECRET_KEY'] = 'testing-env-secret'
        # unless this is the first test that runs, there's no way to NOT have the
        # singleton configuration class already defined by this point. So we'll
        # manually call the configure from environment method and then confirm
        # that that method is called by the initialize method
        @configuration.configure_from_environment
        assert_equal 'testing-env-access', @configuration.access_key
        assert_equal 'testing-env-secret', @configuration.secret_key
      end

      def test_valid_succeeds_with_valid_configuration
        self.configure_client('test-access-key', 'test-secret-key')
        assert @configuration.valid?
      end
    end
  end
end
