# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # raw_content_block_delta_event => {
    #   delta: Anthropic::Models::RawContentBlockDeltaEvent::Delta,
    #   index: Integer,
    #   type: Anthropic::Models::RawContentBlockDeltaEvent::Type
    # }
    # ```
    class RawContentBlockDeltaEvent < Anthropic::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta]
      required :delta, union: -> { Anthropic::Models::RawContentBlockDeltaEvent::Delta }

      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RawContentBlockDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawContentBlockDeltaEvent::Type }

      # @!parse
      #   # @param delta [Anthropic::Models::TextDelta, Anthropic::Models::InputJSONDelta]
      #   # @param index [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(delta:, index:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case delta
      # in Anthropic::Models::TextDelta
      #   # ...
      # in Anthropic::Models::InputJSONDelta
      #   # ...
      # end
      # ```
      class Delta < Anthropic::Union
        variant -> { Anthropic::Models::TextDelta }

        variant -> { Anthropic::Models::InputJSONDelta }
      end

      # @example
      # ```ruby
      # case type
      # in :content_block_delta
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        CONTENT_BLOCK_DELTA = :content_block_delta

        finalize!
      end
    end
  end
end
