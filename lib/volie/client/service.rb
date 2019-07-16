# frozen_string_literal: true

module Volie
  module Client
    # This class corresponds to services on Volie's services
    # and can be used to perform operations on their servers
    class Service < Resource
      VALID_KEYS = %i[
        service_key
        account_key
        advisor_employee_key
        customer_key
        customer_vehicle_key
        organization_key
        vehicle_key
        close_date
        customer_number
        labor_amount_customer_pay
        labor_amount_internal
        labor_amount_warranty
        odometer_in
        odometer_out
        open_date
        parts_amount_customer_pay
        parts_amount_internal
        parts_amount_warranty
        promise_date
        ro_amount
        ro_number
        ro_status_code
        ro_status_description
        service_lines
      ].freeze

      class << self
        def find_or_create_by(attributes, configuration = nil)
          result = post(path: 'match_or_create_service', parameters: attributes, configuration: configuration)
          result[:service_lines] ||= []
          result[:service_lines] = result[:service_lines].map(&ServiceLine.method(:new))
          new result
        end
      end
    end
  end
end
