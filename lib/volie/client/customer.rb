# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding Campaign objects, and
    # for representing campaign objects once received. It's also
    # responsible for representing campaign objects and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST api rather than a database.
    class Customer < Resource
      VALID_KEYS = %i[address_1 address_2 cell_phone cell_phone_dnc_flag city_region created_at customer_key
                      deleted_at dnc_at do_not_contact_flag email_address_1 email_address_2 first_name
                      full_name home_phone home_phone_dnc_flag last_name lat_lng latitude longitude
                      middle_name organization_key postal_code state_province time_zone updated_at
                      work_phone work_phone_dnc_flag].freeze
      define_rest_actions :customer, except: :create
    end
  end
end
