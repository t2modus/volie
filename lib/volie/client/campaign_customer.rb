# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding campaign customer objects,
    # representing the data returned, and providing association
    # methods. Like an ActiveRecord instance, but backed by
    # a REST API rather than a database.
    class CampaignCustomer < Resource
      VALID_KEYS = %i[appointment_key assigned_at assigned_to attempt_count
                      campaign_customer_key campaign_email_sent campaign_key
                      campaign_run_key completed_at contacted contacted_at
                      created_at customer_key customer_vehicle_key
                      eligible_for_outbound expiration_code expired_at
                      expires_at is_completed last_attempt_time organization_key
                      sale_key survey_key updated_at upload_file_key vehicle_key].freeze
      define_rest_actions :campaign_customer, except: :create

      def remove_from_queue
        response = self.class.post(
          path: 'remove_customer_from_queue',
          parameters: { campaign_customer_key: self.campaign_customer_key }
        )
        response.is_a?(Hash) && response['errors'] == false
      end

      def set_customer_vehicle(make:, model:, year:, trim:, vin:)
        self.class.post(
          path: 'set_customer_vehicle',
          parameters: {
            campaign_customer_key: self.campaign_customer_key,
            vehicle_make: make,
            vehicle_mode: model,
            vehicle_model_year: year,
            vehicle_trim: trim,
            vehicle_vin: vin
          }
        )
      end

      class << self
        def create(attributes)
          new post(path: 'enroll_campaign_customer', parameters: attributes)
        end
      end
    end
  end
end
