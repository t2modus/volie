# frozen_string_literal: true

require 'test_helper'
require 'helpers/resource_helper'

module Volie
  module Client
    class CallTest < Minitest::Test
      include ResourceHelper
      extend ResourceClassHelper

      define_standard_resource_tests('call', except: :create)
    end
  end
end
