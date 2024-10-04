# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStartEvent < BaseModel
      # @!attribute [rw] content_block
      #   @return [Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock]
      required :content_block, Anthropic::Unknown

      # @!attribute [rw] index
      #   @return [Integer]
      required :index, Integer

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawContentBlockStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockStartEvent::Type }

      class Type < Anthropic::Enum
        CONTENT_BLOCK_START = :content_block_start
      end
    end
  end
end
