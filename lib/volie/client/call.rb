# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding Campaign objects, and
    # for representing campaign objects once received. It's also
    # responsible for representing campaign objects and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST api rather than a database.
    class Call < Resource
      VALID_KEYS = %i[agent_call agent_talk_duration attempt_key call_key
                      call_price call_price_unit call_sid campaign_customer_key
                      campaign_key conference_sid created_at customer_call
                      customer_dropped customer_key disposition_key end_time
                      friendly_direction friendly_duration friendly_from_number
                      friendly_to_number hold_duration is_appointment is_complete
                      is_dropped is_hot_alert organization_closed organization_key
                      phone_number_sid recording_key recording_sid recording_url
                      start_time survey_attempt_key survey_key transfer_call
                      transfer_type updated_at wrap_up_duration].freeze
      define_rest_actions :call, except: :create
    end
  end
end
