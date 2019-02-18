# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for adding custom fields to whatever resource we are wanting
    class CustomField < Resource
      VALID_KEYS = %i[custom_field_key account_key data_import_custom_field_key data_import_field_key
                      modelable_key modelable_type created_at data_type is_active key source updated_at value]
      # the fields required to create this are:
      # modelable_type modelable_key data_type key value

      define_rest_actions :custom_field
    end
  end
end
