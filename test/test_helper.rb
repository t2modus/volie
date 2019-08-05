# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'volie'

require 'byebug'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

ENV['VOLIE_ACCESS_KEY'] = "fake"
ENV['VOLIE_ACCESS_KEY'] = "faker"

module Minitest
  class Test
    def before_setup
      Volie::Client::Configuration.new
      super # needed to allow mocha setup
    end

    def new_configuration
      Volie::Client::Configuration.new(access_key: nil, secret_key: nil)
      if @access_key.nil? && @secret_key.nil?
        @access_key = "test"
        @secret_key = "test"
      else
        @access_key = access_key
        @secret_key = secret_key
      end
    end

    def use_default_configuration
      ::Volie::Client.configure(access_key: 'fake', secret_key: 'faker')
    end
  end
end

require 'mocha/minitest'
require 'webmock/minitest'
