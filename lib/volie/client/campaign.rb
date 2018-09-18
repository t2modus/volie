# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding Campaign objects, and
    # for representing campaign objects once received. It's also
    # responsible for representing campaign objects and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST api rather than a database.
    class Campaign < Resource
      VALID_KEYS = %i[adf_email adf_enabled banner_message call_queue_added_order call_queue_attempt_order campaign_key
                      campaign_name created_at customer_expiration_days data_source deleted_at end_date exclusion_exempt
                      is_active is_outbound marketing_exclusion_days max_attempts max_daily_customers organization_key
                      priority purpose recurring_days recurring_type run_priority send_to_voice_mail start_date
                      twilio_number_key updated_at user_key voice_mail_greeting_text whisper_message].freeze

      define_rest_actions :campaign
    end
  end
end
