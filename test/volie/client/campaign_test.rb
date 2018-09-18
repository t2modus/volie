# frozen_string_literal: true

require 'test_helper'
require 'helpers/resource_helper'

module Volie
  module Client
    class CampaignTest < Minitest::Test
      include ResourceHelper
      extend ResourceClassHelper

      define_standard_resource_tests('campaign')
    end
  end
end
