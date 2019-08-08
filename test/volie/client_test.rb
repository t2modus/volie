# frozen_string_literal: true

module Volie
  class ClientTest < Minitest::Test
    def test_can_configure_with_block
      configuration = Volie::Client::Configuration.new
      configuration.access_key = nil
      configuration.secret_key = nil
      assert_nil configuration.access_key
      assert_nil configuration.secret_key
      configuration.configure do |config|
        config.access_key = 'test-access'
        config.secret_key = 'test-secret'
      end
      assert_equal 'test-access', configuration.access_key
      assert_equal 'test-secret', configuration.secret_key
    end

    def test_can_configure_with_arguments
      configuration = Volie::Client::Configuration.new
      configuration.access_key = nil
      configuration.secret_key = nil
      assert_nil configuration.access_key
      assert_nil configuration.secret_key
      Client.configure(access_key: 'test-access', secret_key: 'test-secret')
      assert_equal 'test-access', configuration.access_key
      assert_equal 'test-secret', configuration.secret_key
    end

    def test_can_get_configuration
      Client.configure(access_key: 'access', secret_key: 'secret')
      assert_equal 'access', Client.configuration.access_key
      assert_equal 'secret', Client.configuration.secret_key
    end
  end
end
