# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlock < Anthropic::BaseModel
        # @!attribute text
        #   @return [String]
        required :text, String

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlock::Type }

        class Type < Anthropic::Enum
          TEXT = :text
        end

        # @!parse
        #   # Create a new instance of BetaTextBlock from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :text
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaTextBlock = Beta::BetaTextBlock
  end
end
