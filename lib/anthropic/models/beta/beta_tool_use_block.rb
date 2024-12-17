# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolUseBlock < Anthropic::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Unknown

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolUseBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolUseBlock::Type }

        # @!parse
        #   # @param id [String]
        #   # @param input [Object]
        #   # @param name [String]
        #   # @param type [String]
        #   #
        #   def initialize(id:, input:, name:, type:) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :tool_use
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TOOL_USE = :tool_use
        end
      end
    end

    BetaToolUseBlock = Beta::BetaToolUseBlock
  end
end
