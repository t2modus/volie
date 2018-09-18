# frozen_string_literal: true

require 'helpers/constants'

module ResourceHelper
  def setup
    ::Volie::Client.configure(access_key: 'fake key', secret_key: 'other_fake_key')
  end

  def fake_resource(resource_name)
    send("fake_#{resource_name}")
  end

  def stub_resource_request(action, resource_name, expected_response, expected_code)
    stub_request(:post, /#{action}_#{resource_name}/).to_return(body: expected_response, status: expected_code)
  end

  RESOURCES.each do |resource|
    define_method "fake_#{resource}" do
      "FAKE_#{resource.upcase}".constantize
    end

    # there's really no way to make these fit nicely on one line or to break them up
    # rubocop:disable Metrics/LineLength
    define_method "stub_list_#{resource.pluralize}" do |expected_response = [send("fake_#{resource}")].to_json, expected_code = 200|
      stub_resource_request(:get, resource.pluralize, expected_response, expected_code)
    end

    define_method "stub_create_#{resource}" do |expected_response = send("fake_#{resource}").to_json, expected_code = 200|
      stub_resource_request(:create, resource, expected_response, expected_code)
    end

    define_method "stub_find_#{resource}" do |expected_response = send("fake_#{resource}").to_json, expected_code = 200|
      stub_resource_request(:find, resource, expected_response, expected_code)
    end
    # rubocop:enable Metrics/LineLength
  end
end

module ResourceClassHelper
  def should_define_rest_action_test?(action, options)
    options[:except] = [options[:except]].flatten.compact
    options[:only] = [options[:only]].flatten.compact
    !(
      options[:except].map(&:to_s).include?(action.to_s) ||
      (options[:only].size.positive? && !options[:only].map(&:to_s).include?(action.to_s))
    )
  end

  def define_standard_resource_tests(resource_name, options = {})
    params = options.with_indifferent_access
    resource_class = "::Volie::Client::#{resource_name.titleize}".constantize

    if should_define_rest_action_test?(:create, params)
      define_method "test_can_create_a_#{resource_name}" do
        send("stub_create_#{resource_name}")
        assert_equal(
          resource_class.new(fake_resource(resource_name)),
          resource_class.create(fake_resource(resource_name))
        )
      end
    end

    if should_define_rest_action_test?(:list, params)
      define_method "test_can_list_previously_saved_#{resource_name.pluralize}" do
        send("stub_list_#{resource_name.pluralize}")
        assert_equal [resource_class.new(fake_resource(resource_name))], resource_class.list
      end
    end

    # I'm intentionally not using a guard clause here to match the style of the previous blocks
    # rubocop:disable Style/GuardClause
    if should_define_rest_action_test?(:find, params)
      define_method "test_can_find_a_#{resource_name}_by_its_key" do
        send("stub_find_#{resource_name}")
        assert_equal(
          resource_class.new(fake_resource(resource_name)),
          resource_class.find(fake_resource(resource_name)["#{resource_name}_key"])
        )
      end
    end
    # rubocop:enable Style/GuardClause
  end
end
