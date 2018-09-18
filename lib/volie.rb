# frozen_string_literal: true

require 'active_support/core_ext/hash/indifferent_access'
require 'active_support/core_ext/object/blank'
require 'active_support/core_ext/string/inflections'

require 'volie/version'
require 'volie/client'

# This module serves primarily as a namespace into
# the Volie application. Since we're also going to
# be using a "Client" namespace, users of this gem
# should be able to use a Volie namespace module as
# well within their code with no problem.
module Volie; end
