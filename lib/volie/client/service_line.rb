# frozen_string_literal: true

module Volie
  module Client
    # This class represents service detail line information on Volie's servers
    # Unlike the rest of the classes in this gem, it does NOT interact with the
    # volie servers directly. Instead, it's used for validation purposes when
    # creating new objects, and it's returned to the user in the service object
    #
    # In this case, we're still going to inherit from resource just to take
    # advantage of all the other helper methods we've defined. That way, this
    # class will behave the same way that the other resource classes do, for
    # a consistent end-user experience. It just won't define any available
    # actions.
    class ServiceLine < Resource
      VALID_KEYS = %i[
        service_line_key
        account_key
        advisor_employee_key
        organization_key
        service_key
        technician_employee_key
        actual_hours
        advisor_key
        complaint_statement
        correction_comments
        gog_amount
        gog_cost
        gog_profit
        labor_amount
        labor_cost
        labor_profit
        labor_type
        line_number
        misc_amount
        misc_cost
        misc_profit
        operation_code
        operation_description
        parts_amount
        parts_cost
        parts_profit
        ro_number
        technician_key
      ].freeze
    end
  end
end
