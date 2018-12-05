# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for communicating with the Volie
    # Servers about Users
    class User < Resource
      VALID_KEYS = %i[user_key activated_organization_key created_at deleted_at email first_name full_name
                      inbound_calls_today is_active is_agent last_name last_sign_in_at online_agent outbound_calls_today
                      phone_number_1 phone_number_2 queues_locked skill_level sign_in_count system_alerts time_zone
                      updated_at zone_offset].freeze
      define_rest_actions :user, except: :create
    end
  end
end
