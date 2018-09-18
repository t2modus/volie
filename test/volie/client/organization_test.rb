# frozen_string_literal: true

require 'test_helper'
require 'helpers/resource_helper'

module Volie
  module Client
    class OrganizationTest < Minitest::Test
      include ResourceHelper
      extend ResourceClassHelper

      define_standard_resource_tests('organization')
    end
  end
end
