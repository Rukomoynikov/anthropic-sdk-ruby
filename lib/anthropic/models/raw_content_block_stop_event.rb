# frozen_string_literal: true

module Anthropic
  module Models
    class RawContentBlockStopEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute index
      #
      #   @return [Integer]
      required :index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_stop]
      required :type, const: :content_block_stop

      # @!parse
      #   # @param index [Integer]
      #   # @param type [Symbol, :content_block_stop]
      #   #
      #   def initialize(index:, type: :content_block_stop, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
