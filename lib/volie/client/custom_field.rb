# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for adding custom fields to whatever resource we are wanting
    class CustomField < Resource
      VALID_KEYS = %i[account_key custom_field_key modelable_key modelable_type created_at data_type
                      is_active source key value]

      # EXAMPLE: t2_lead_id on the sale
      # custom_field_key: random-1234678-rand-139084
      # modelable_type: 'Sale'
      # modelable_key: random-1234678-rand-139084
      # data_type: 'string'
      # is_active: true
      # key: 't2_lead_id'
      # value: '1'
      # account_key: random-1234678-rand-139084
      # source: 'Api'
      # created_at: 12345678

      define_rest_actions :custom_fields
    end
  end
end
