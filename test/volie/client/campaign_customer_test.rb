# frozen_string_literal: true

require 'test_helper'
require 'helpers/resource_helper'

module Volie
  module Client
    class CampaignCustomerTest < Minitest::Test
      include ResourceHelper
      extend ResourceClassHelper

      define_standard_resource_tests('campaign_customer', except: :create)

      def test_remove_from_queue
        stub_request(:post, /remove_customer_from_queue/).to_return(
          body: '{"errors": false}',
          status: 200
        )
        assert CampaignCustomer.new(fake_campaign_customer).remove_from_queue
      end

      def test_remove_from_queue_returns_false_when_fails
        stub_request(:post, /remove_customer_from_queue/).to_return(
          body: '{"errors": "This is an error message"}',
          status: 200 # returning a 400 because otherwise our code raises an error
        )
        refute CampaignCustomer.new(fake_campaign_customer).remove_from_queue
      end

      def test_set_customer_vehicle
        stub_request(:post, /set_customer_vehicle/).to_return(
          body: FAKE_VEHICLE_RESPONSE.to_json,
          status: 200
        )
        result = CampaignCustomer.new(fake_campaign_customer)
                                 .set_customer_vehicle(
                                   make: 'Honda',
                                   model: 'Accord',
                                   year: 2018,
                                   trim: nil,
                                   vin: '1HGBA7433GA007422'
                                 )
        assert_equal FAKE_VEHICLE_RESPONSE, result
      end

      def test_can_create_a_campaign_customer
        configuration = Volie::Client::Configuration.new(access_key: "access", secret_key: "secret")
        stub_resource_request(:enroll, :campaign_customer, FAKE_CAMPAIGN_CUSTOMER.to_json, 200)
        assert_equal CampaignCustomer.new(FAKE_CAMPAIGN_CUSTOMER), CampaignCustomer.create(FAKE_CAMPAIGN_CUSTOMER, configuration)
      end
    end
  end
end
