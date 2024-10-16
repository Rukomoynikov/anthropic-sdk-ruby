# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawContentBlockDeltaEvent < BaseModel
      # @!attribute [rw] delta
      #   @return [Anthropic::Models::BetaInputJSONDelta, Anthropic::Models::BetaTextDelta]
      required :delta, Anthropic::Unknown

      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawContentBlockDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawContentBlockDeltaEvent::Type }

      class Type < Anthropic::Enum
        CONTENT_BLOCK_DELTA = :content_block_delta
      end

      # @!parse
      #   # Create a new instance of BetaRawContentBlockDeltaEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :delta
      #   #   @option data [Integer] :index
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
