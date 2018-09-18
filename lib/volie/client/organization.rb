# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication with
    # Volie server's regarding Organization objects, and
    # for representing organization objects once received
    class Organization < Resource
      VALID_KEYS = %i[address_1 address_2 city_region country created_at data_provided_area_key
                      data_provider_remote_key data_provider_store_key data_provider_vendor_name
                      deleted_at dms_key is_active main_phone_number name organization_key
                      postal_code remote_key state_province time_zone updated_at website_address].freeze

      define_rest_actions :organization
    end
  end
end
