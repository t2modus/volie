# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for adding custom fields to whatever resource we are wanting
    class CustomField < Resource
      VALID_KEYS = %i[account_key custom_field_key modelable_key modelable_type created_at data_type
                      is_active source key value]

      define_rest_actions :custom_field
    end
  end
end
