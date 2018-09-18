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
  'created_at' => 1488830951,
  'customer_expiration_days' => 50000,
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
  'recurring_days' => ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
  'recurring_type' => 1,
  'run_priority' => 10,
  'send_to_voice_mail' => false,
  'start_date' => 1488830942,
  'updated_at' => 1501510182,
  'voice_mail_greeting_text' => nil,
  'whisper_message' => nil
}.freeze

FAKE_CALL = {
  'call_key'=>'ffcafb5f-d61f-4a03-b224-240c269233e4',
  'campaign_customer_key'=>'0456b316-3eaa-4542-ba4b-c52d5fc98e46',
  'campaign_key'=>'c3d150b4-8680-4fad-962d-603cee1f757e',
  'customer_key'=>'7b4d5b20-f613-0134-07fe-72a2b8f8d9ae',
  'disposition_key'=>'49ddc4c0-dfa6-0134-9a73-22f07aca6ca7',
  'organization_key'=>'dce4b6f0-e4d5-0134-a902-7ea06458c1e8',
  'recording_key'=>'9c2beb03-fa40-4e9c-a602-e677bdcbe9d3',
  'survey_attempt_key'=>'1d2cd270-e4d7-0134-eb23-0e72b07369b1',
  'survey_key'=>'1d89b7f0-e4d7-0134-eb24-0e72b07369b1',
  'attempt_key'=>'00d10710-e4d7-0134-eb22-0e72b07369b1',
  'call_sid'=>'CA3ecb36f6ed60ade502e2589143d5a834',
  'conference_sid'=>'CF2239194bbb69f5215023a8a94f5b43a2',
  'phone_number_sid'=>'PNa1e1050d0568440c3ce19022e77716ef',
  'recording_sid'=>'RE22ff704e7be583a3fef6ba6aa822c040',
  'agent_call'=>false,
  'agent_talk_duration'=>5,
  'call_price'=>0.0075,
  'call_price_unit'=>'USD',
  'created_at'=>1488831037,
  'customer_call'=>true,
  'customer_dropped'=>false,
  'end_time'=>1488831094,
  'friendly_direction'=>'inbound',
  'friendly_duration'=>57,
  'friendly_from_number'=>'3192407215',
  'friendly_to_number'=>'3192502477',
  'hold_duration'=>0,
  'is_appointment'=>false,
  'is_complete'=>true,
  'is_dropped'=>false,
  'is_hot_alert'=>false,
  'organization_closed'=>false,
  'recording_url'=>
  'https://s3.amazonaws.com/switch-telephony-recordings/RE22ff704e7be583a3fef6ba6aa822c040.mp3',
  'start_time'=>1488831037,
  'transfer_call'=>false,
  'transfer_type'=>'no_transfer',
  'updated_at'=>1488831112,
  'wrap_up_duration'=>0
}

RESOURCES = %w[organization campaign call].freeze

module ResourceHelper
  def setup
    ::Volie::Client.configure(access_key: 'fake key', secret_key: 'other_fake_key')
  end

  RESOURCES.each do |resource|
    define_method "fake_#{resource}" do
      "FAKE_#{resource.upcase}".constantize
    end

    def fake_resource(resource_name)
      send("fake_#{resource_name}")
    end

    define_method "stub_list_#{resource.pluralize}" do |expected_response = [send("fake_#{resource}")].to_json, expected_code = 200|
      stub_request(:post, /get_#{resource.pluralize}/).to_return(body: expected_response, status: expected_code)
    end

    define_method "stub_create_#{resource}" do |expected_response = send("fake_#{resource}").to_json, expected_code = 200|
      stub_request(:post, /create_#{resource}/).to_return(body: expected_response, status: expected_code)
    end

    define_method "stub_find_#{resource}" do |expected_response = send("fake_#{resource}").to_json, expected_code = 200|
      stub_request(:post, /find_#{resource}/).to_return(body: expected_response, status: expected_code)
    end
  end
end

module ResourceClassHelper
  def should_define_rest_action_test?(action, options)
    options[:except] = [options[:except]].flatten.compact
    options[:only] = [options[:only]].flatten.compact
    !(
      (options[:except].map(&:to_s).include?(action.to_s)) ||
      (options[:only].size > 0 && !options[:only].map(&:to_s).include?(action.to_s))
    )
  end

  def define_standard_resource_tests(resource_name, options = {})
    params = options.with_indifferent_access
    resource_class = "::Volie::Client::#{resource_name.titleize}".constantize

    if should_define_rest_action_test?(:create, params)
      define_method "test_can_create_a_#{resource_name}" do
        send("stub_create_#{resource_name}")
        assert_equal resource_class.new(fake_resource(resource_name)), resource_class.create(fake_resource(resource_name))
      end
    end

    if should_define_rest_action_test?(:list, params)
      define_method "test_can_list_previously_saved_#{resource_name.pluralize}" do
        send("stub_list_#{resource_name.pluralize}")
        assert_equal [resource_class.new(fake_resource(resource_name))], resource_class.list
      end
    end

    if should_define_rest_action_test?(:find, params)
      define_method "test_can_find_a_#{resource_name}_by_its_key" do
        send("stub_find_#{resource_name}")
        assert_equal resource_class.new(fake_resource(resource_name)), resource_class.find(fake_resource(resource_name)["#{resource_name}_key"])
      end
    end
  end
end

