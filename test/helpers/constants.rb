# frozen_string_literal: true

FAKE_ORGANIZATION = {
  'address_1' => '905 Shadow Ridge Dr',
  'address_2' => nil,
  'city_region' => 'Highland Village',
  'country' => 'USA',
  'created_at' => 1_537_200_097,
  'data_provided_area_key' => nil,
  'data_provider_remote_key' => nil,
  'data_provider_store_key' => nil,
  'data_provider_vendor_name' => nil,
  'deleted_at' => nil,
  'dms_key' => nil,
  'is_active' => true,
  'main_phone_number' => '800-257-9722',
  'name' => 'T2 Modus Test',
  'organization_key' => '58a94fae-d409-4f73-b0de-94d93fbc9fe8',
  'postal_code' => '75077',
  'remote_key' => nil,
  'state_province' => 'TX',
  'time_zone' => 'Central Time (US & Canada)',
  'updated_at' => 1_537_200_097,
  'website_address' => 'www.t2sellscars.com'
}.freeze

FAKE_CAMPAIGN = {
  'campaign_key' => 'c3d150b4-8680-4fad-962d-603cee1f757e',
  'organization_key' => 'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'twilio_number_key' => '0c6f9b46-3bf4-4a9d-913c-03d112a9ab6a',
  'user_key' => nil,
  'adf_email' => nil,
  'adf_enabled' => false,
  'banner_message' => '',
  'call_queue_added_order' => 'ASC',
  'call_queue_attempt_order' => 'ASC',
  'campaign_name' => 'PSHQ Inbound',
  'created_at' => 1_488_830_951,
  'customer_expiration_days' => 50_000,
  'data_source' => 'Uploaded',
  'deleted_at' => nil,
  'end_date' => nil,
  'exclusion_exempt' => false,
  'is_active' => true,
  'is_outbound' => false,
  'marketing_exclusion_days' => 30,
  'max_attempts' => 3,
  'max_daily_customers' => nil,
  'priority' => 1,
  'purpose' => 'inbound',
  'recurring_days' => %w[Monday Tuesday Wednesday Thursday Friday Saturday],
  'recurring_type' => 1,
  'run_priority' => 10,
  'send_to_voice_mail' => false,
  'start_date' => 1_488_830_942,
  'updated_at' => 1_501_510_182,
  'voice_mail_greeting_text' => nil,
  'whisper_message' => nil
}.freeze

FAKE_CALL = {
  'call_key' => 'ffcafb5f-d61f-4a03-b224-240c269233e4',
  'campaign_customer_key' => '0456b316-3eaa-4542-ba4b-c52d5fc98e46',
  'campaign_key' => 'c3d150b4-8680-4fad-962d-603cee1f757e',
  'customer_key' => '7b4d5b20-f613-0134-07fe-72a2b8f8d9ae',
  'disposition_key' => '49ddc4c0-dfa6-0134-9a73-22f07aca6ca7',
  'organization_key' => 'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'recording_key' => '9c2beb03-fa40-4e9c-a602-e677bdcbe9d3',
  'survey_attempt_key' => '1d2cd270-e4d7-0134-eb23-0e72b07369b1',
  'survey_key' => '1d89b7f0-e4d7-0134-eb24-0e72b07369b1',
  'attempt_key' => '00d10710-e4d7-0134-eb22-0e72b07369b1',
  'call_sid' => 'CA3ecb36f6ed60ade502e2589143d5a834',
  'conference_sid' => 'CF2239194bbb69f5215023a8a94f5b43a2',
  'phone_number_sid' => 'PNa1e1050d0568440c3ce19022e77716ef',
  'recording_sid' => 'RE22ff704e7be583a3fef6ba6aa822c040',
  'agent_call' => false,
  'agent_talk_duration' => 5,
  'call_price' => 0.0075,
  'call_price_unit' => 'USD',
  'created_at' => 1_488_831_037,
  'customer_call' => true,
  'customer_dropped' => false,
  'end_time' => 1_488_831_094,
  'friendly_direction' => 'inbound',
  'friendly_duration' => 57,
  'friendly_from_number' => '3192407215',
  'friendly_to_number' => '3192502477',
  'hold_duration' => 0,
  'is_appointment' => false,
  'is_complete' => true,
  'is_dropped' => false,
  'is_hot_alert' => false,
  'organization_closed' => false,
  'recording_url' =>
  'https://s3.amazonaws.com/switch-telephony-recordings/RE22ff704e7be583a3fef6ba6aa822c040.mp3',
  'start_time' => 1_488_831_037,
  'transfer_call' => false,
  'transfer_type' => 'no_transfer',
  'updated_at' => 1_488_831_112,
  'wrap_up_duration' => 0
}.freeze

FAKE_APPOINTMENT = {
  'appointment_key' => '7987a803-189d-4c71-8dd1-8ac717f5affb',
  'account_key' => '687dadfd-4088-4ba4-aa14-e4f1a77100b8',
  'campaign_key' => 'c3d150b4-8680-4fad-962d-603cee1f757e',
  'customer_key' => '7b4d5b20-f613-0134-07fe-72a2b8f8d9ae',
  'organization_key' => 'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'survey_attempt_key' => '52183250-f268-0134-d464-222b95a3deca',
  'user_key' => nil,
  'appointment_datetime' => 1_490_346_780,
  'attempt_key' => 'e2878990-f267-0134-1437-22e36f163166',
  'appointment_status' => nil,
  'created_at' => 1_490_322_865,
  'deleted_at' => nil,
  'updated_at' => 1_500_970_284,
  'vehicle_make' => nil,
  'vehicle_model' => nil,
  'vehicle_year' => nil,
  'vin' => nil
}.freeze

FAKE_DISPOSITION = {
  'disposition_key' => '49dc1c60-dfa6-0134-9a72-22f07aca6ca7',
  'organization_key' => nil,
  'created_at' => 1_488_260_408,
  'deleted_at' => nil,
  'denotes_appointment' => false,
  'denotes_callback' => false,
  'denotes_contact' => false,
  'disposition_description' => 'InProgress',
  'is_active' => true,
  'is_complete' => false,
  'is_default' => false,
  'is_global' => true,
  'is_organization_only' => false,
  'send_survey' => false,
  'tooltip_text' => nil,
  'updated_at' => 1_488_260_408
}.freeze

FAKE_CUSTOMER = {
  'customer_key' => '7b4d5b20-f613-0134-07fe-72a2b8f8d9ae',
  'organization_key' => 'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'address_1' => nil,
  'address_2' => nil,
  'cell_phone' => '3192407215',
  'cell_phone_dnc_flag' => nil,
  'city_region' => nil,
  'created_at' => 1_488_831_112,
  'deleted_at' => nil,
  'do_not_contact_flag' => false,
  'dnc_at' => nil,
  'email_address_1' => 'sam9@cfu.net',
  'email_address_2' => nil,
  'first_name' => 'Sam',
  'full_name' => 'Sam Davis',
  'middle_name' => 'Arthur',
  'home_phone' => '6128405950',
  'home_phone_dnc_flag' => nil,
  'last_name' => 'Davis',
  'lat_lng' => nil,
  'latitude' => nil,
  'longitude' => nil,
  'postal_code' => nil,
  'state_province' => nil,
  'time_zone' => nil,
  'updated_at' => 1_504_639_916,
  'work_phone' => '3192402743',
  'work_phone_dnc_flag' => nil
}.freeze

FAKE_CAMPAIGN_CUSTOMER = {
  'campaign_customer_key' => '0456b316-3eaa-4542-ba4b-c52d5fc98e46',
  'appointment_key' => nil,
  'campaign_key' => 'c3d150b4-8680-4fad-962d-603cee1f757e',
  'campaign_run_key' => nil,
  'customer_vehicle_key' => nil,
  'customer_key' => '7b4d5b20-f613-0134-07fe-72a2b8f8d9ae',
  'organization_key' => 'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'survey_key' => '1d89b7f0-e4d7-0134-eb24-0e72b07369b1',
  'upload_file_key' => nil,
  'vehicle_key' => nil,
  'assigned_at' => nil,
  'assigned_to' => nil,
  'attempt_count' => 0,
  'campaign_email_sent' => false,
  'completed_at' => 1_488_831_134,
  'contacted' => true,
  'contacted_at' => 1_488_831_134,
  'created_at' => 1_493_234_657,
  'eligible_for_outbound' => false,
  'expiration_code' => 'already_completed',
  'expired_at' => 1_496_852_108,
  'expires_at' => 1_577_836_800,
  'is_completed' => true,
  'last_attempt_time' => 1_488_831_134,
  'updated_at' => 1_496_852_108
}.freeze

FAKE_VEHICLE = {
  'vehicle_make' => 'Honda',
  'vehicle_model' => 'Accord',
  'vehicle_model_year' => 2018,
  'vehicle_trim' => nil,
  'vehicle_vin' => '1HGBA7433GA007422'
}.freeze

FAKE_VEHICLE_RESPONSE = {
  'campaign_customer_key' => '0456b316-3eaa-4542-ba4b-c52d5fc98e46',
  'appointment_key' => nil,
  'campaign_key' => 'c3d150b4-8680-4fad-962d-603cee1f757e',
  'campaign_run_key' => nil,
  'customer_vehicle_key' => '8e1e14cb-8f72-431a-9664-40808bdc09ac',
  'customer_key' => '7b4d5b20-f613-0134-07fe-72a2b8f8d9ae',
  'organization_key' => 'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'survey_key' => '1d89b7f0-e4d7-0134-eb24-0e72b07369b1',
  'upload_file_key' => nil,
  'vehicle_key' => '55e0f08a-1ea5-4fe5-94de-89770e61282a',
  'assigned_at' => nil,
  'assigned_to' => nil,
  'attempt_count' => 0,
  'campaign_email_sent' => false,
  'completed_at' => 1_488_831_134,
  'contacted' => true,
  'contacted_at' => 1_488_831_134,
  'created_at' => 1_493_234_657,
  'eligible_for_outbound' => false,
  'expiration_code' => 'already_completed',
  'expired_at' => 1_496_852_108,
  'expires_at' => 1_577_836_800,
  'is_completed' => true,
  'last_attempt_time' => 1_488_831_134,
  'updated_at' => 1_496_852_108
}.freeze

RESOURCES = %w[organization campaign call appointment disposition customer campaign_customer].freeze
