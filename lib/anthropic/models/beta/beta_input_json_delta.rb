# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaInputJSONDelta < Anthropic::BaseModel
        # @!attribute partial_json
        #   @return [String]
        required :partial_json, String

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaInputJSONDelta::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaInputJSONDelta::Type }

        class Type < Anthropic::Enum
          INPUT_JSON_DELTA = :input_json_delta
        end

        # @!parse
        #   # Create a new instance of BetaInputJSONDelta from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :partial_json
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaInputJSONDelta = Beta::BetaInputJSONDelta
  end
end
