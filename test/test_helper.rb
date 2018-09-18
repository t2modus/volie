# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'volie'

require 'byebug'
require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use! Minitest::Reporters::ProgressReporter.new

module Minitest
  class Test
    def before_setup
      Volie::Client::Configuration.instance.clear!
      super # needed to allow mocha setup
    end

    def use_default_configuration
      ::Volie::Client.configure(access_key: 'fake', secret_key: 'faker')
    end
  end
end

require 'mocha/minitest'
require 'webmock/minitest'
