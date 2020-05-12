# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding campaign customer
    # objects, representing the data returned, and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST API rather than a database.
    class CustomerVehicle < Resource
      VALID_KEYS = %i[customer_key customer_vehicle_key vehicle_key vehicle_make
                      vehicle_model vehicle_model_year vehicle_trim vehicle_vin].freeze
      define_rest_actions :customer_vehicle, only: %i[create find]
    end
  end
end
