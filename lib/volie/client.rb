# frozen_string_literal: true

# configuration classes
require 'volie/client/configuration'
require 'volie/client/error'

# base resource class
require 'volie/client/resource'

# resource sublcasses
require 'volie/client/appointment'
require 'volie/client/call'
require 'volie/client/campaign'
require 'volie/client/campaign_customer'
require 'volie/client/expire_customer'
require 'volie/client/customer'
require 'volie/client/custom_field'
require 'volie/client/disposition'
require 'volie/client/organization'
require 'volie/client/sale'
require 'volie/client/service'
require 'volie/client/service_line'
require 'volie/client/survey_attempt'
require 'volie/client/user'

module Volie
  # This module serves primarily as a namespace for the API code,
  # while also providing a few simple methods to allow configuration
  # of the API code with the appropriate credentials.
  module Client
    # this method provides access to allow configuring the object
    def self.configure(access_key: nil, secret_key: nil)
      if access_key.nil? && secret_key.nil?
        yield Configuration.new
      else
        Configuration.new(access_key: access_key, secret_key: secret_key)
      end
    end

    # and this method provides a way to get the current configuration object
    def self.configuration
      Configuration.new
    end
  end
end
