# frozen_string_literal: true

module Volie
  module Client
    # This class is just used to signal an error commuicating with
    # Volie's servers
    class Error < StandardError; end
  end
end
