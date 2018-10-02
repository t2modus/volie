# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for communicating with the Volie
    # Servers about Survey Attempts
    class SurveyAttempt < Resource
      VALID_KEYS = %i[attempt_key call_key campaign_customer_key campaign_key created_at customer_key department_key
                      disposition_key deleted_at employee_key notes organization_key survey_attempt_key
                      survey_template_key survey_key updated_at user_key voice_mail_recording_key].freeze
      define_rest_actions :survey_attempt, except: :create
    end
  end
end
