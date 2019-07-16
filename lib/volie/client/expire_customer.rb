# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for expiring campaign customers (leads) within volie
    class ExpireCustomer < Resource
      VALID_KEYS = %i[campaign_customer_key].freeze
      # I don't think I need to do any kind of "define_rest_actions" here
      # define_rest_actions :expire_customer, except: :create

      class << self
        def remove(attributes, congfiguration = nil)
          new post(path: 'remove_customer_from_queue', parameters: attributes, configuration: configuration)
        end
      end
    end
  end
end
