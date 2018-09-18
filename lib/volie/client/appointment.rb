# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding appointment objects, and
    # for representing appointment objects once received. It's also
    # responsible for representing appointment objects and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST api rather than a database.
    class Appointment < Resource
      VALID_KEYS = %i[account_key appointment_datetime appointment_key appointment_status
                      attempt_key campaign_key created_at customer_key deleted_at organization_key
                      survey_attempt_key updated_at user_key vehicle_make vehicle_model
                      vehicle_year vin].freeze
      define_rest_actions :appointment, except: :create
    end
  end
end
