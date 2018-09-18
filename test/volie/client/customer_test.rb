# frozen_string_literal: true

require 'test_helper'
require 'helpers/resource_helper'

module Volie
  module Client
    class CustomerTest < Minitest::Test
      include ResourceHelper
      extend ResourceClassHelper

      define_standard_resource_tests('customer', except: :create)

      def test_can_update_a_customer
        expected_result = fake_customer.merge('first_name' => 'Andrew')
        stub_resource_request(:update, :customer, expected_result.to_json, 200)
        assert_equal Customer.new(expected_result), Customer.new(fake_customer).update(first_name: 'Andrew')
        customer = Customer.new(fake_customer)
        customer.first_name = 'Andrew'
        assert_equal Customer.new(expected_result), customer.update
      end

      def test_can_destroy_a_customer
        stub_resource_request(:destroy, :customer, 'OK', 200)
        assert Customer.new(fake_customer).destroy
      end

      def test_if_destroy_fails_it_returns_false
        stub_resource_request(:destroy, :customer, 'ERROR', 400)
        refute Customer.new(fake_customer).destroy
      end

      def test_can_match_or_create_customer
        stub_resource_request(:match_or_create, :customer, fake_customer.to_json, 200)
        assert_equal Customer.new(fake_customer), Customer.find_or_create_by(fake_customer)
      end
    end
  end
end
