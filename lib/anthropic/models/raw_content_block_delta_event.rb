# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < BaseModel
      # @!attribute [rw] delta
      #   @return [Anthropic::Models::InputJSONDelta, Anthropic::Models::TextDelta]
      required :delta, Anthropic::Unknown

      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawContentBlockDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockDeltaEvent::Type }

      class Type < Anthropic::Enum
        CONTENT_BLOCK_DELTA = :content_block_delta
      end
    end
  end
end
