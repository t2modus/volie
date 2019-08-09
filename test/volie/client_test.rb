# frozen_string_literal: true

module Volie
  class ClientTest < Minitest::Test
    def test_can_configure_with_block
      configuration = Volie::Client::Configuration.new
      configuration.access_key = nil
      configuration.secret_key = nil
      assert_nil configuration.access_key
      assert_nil configuration.secret_key
      access_key = 'test-access'
      secret_key = 'test-secret'
      configuration.configure(access_key: access_key, secret_key: secret_key) do |config|
        config.access_key = access_key
        config.secret_key = secret_key
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
      configuration.configure(access_key: 'test-access', secret_key: 'test-secret')
      assert_equal 'test-access', configuration.access_key
      assert_equal 'test-secret', configuration.secret_key
    end

    def test_can_get_configuration
      config = Volie::Client::Configuration.new
      config.configure(access_key: 'access', secret_key: 'secret')
      assert_equal 'access', config.access_key
      assert_equal 'secret', config.secret_key
    end
  end
end
