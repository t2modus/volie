# frozen_string_literal: true

module Volie
  module Client
    # This class is responsible for all communication
    # with Volie's servers regarding Campaign objects, and
    # for representing campaign objects once received. It's also
    # responsible for representing campaign objects and providing
    # association methods. Like an ActiveRecord instance, but
    # backed by a REST api rather than a database.
    class Disposition < Resource
      VALID_KEYS = %i[created_at deleted_at denotes_appointment denotes_callback denotes_contact disposition_description
                      disposition_key is_active is_complete is_default is_global is_organization_only organization_key
                      send_survey tooltip_text updated_at].freeze
      define_rest_actions :disposition, only: :find
    end
  end
end
