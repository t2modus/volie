# frozen_string_literal: true

require 'singleton'
require 'http'

module Volie
  module Client
    # This class is responsible for holding Authentication information for the Volie API
    class Configuration
      attr_accessor :access_key, :secret_key

      def initialize
        self.configure_from_environment
      end

      def configure(access_key:, secret_key:)
        self.access_key = access_key
        self.secret_key = secret_key
      end

      def valid?
        [self.access_key, self.secret_key].none?(&:blank?)
      end

      # This method is primarily used for testing purposes, since we don't want
      # configuration from one test affecting configuration from another
      def clear!
        self.access_key, self.secret_key = []
      end

      def configure_from_environment
        self.configure(
          access_key: ENV['VOLIE_ACCESS_KEY'],
          secret_key: ENV['VOLIE_SECRET_KEY']
        )
      end
    end
  end
end
