# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with the volie servers regarding sales. Like an
    # ActiveRecord instance, but backed by a REST API
    # rather than a database.
    class Sale < Resource
      VALID_KEYS = %i[apr bank_name buyer_address_1 buyer_address_2 buyer_cell_phone buyer_city_region
                      buyer_email_address_1 buyer_first_name buyer_home_phone buyer_last_name buyer_postal_code
                      buyer_state_province buyer_work_phone closing_manager_name closing_manager_number customer_key
                      customer_number deal_book_date deal_number deal_type delivery_odometer extended_warranty_flag
                      fand_i_manager_name fand_i_manager_number lease_cap_cost_reduction lease_odometer_allowance
                      lease_odometer_penalty lease_residual_amount lease_residual_percentage monthly_payment
                      organization_key retail_down_payment sale_key sales_manager_name sales_manager_number
                      salesman_one_name salesman_one_number salesman_two_name salesman_two_number term
                      total_amount_financed total_odometer_allowed vehicle_make vehicle_model vehicle_model_year
                      vehicle_trim vehicle_type vehicle_vin].freeze

      class << self
        def find_or_create_by(attributes)
          new post(path: 'match_or_create_sale', parameters: attributes)
        end
      end
    end
  end
end
