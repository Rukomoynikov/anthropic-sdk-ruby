# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Internal::Type::Unknown

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_use]
        required :type, const: :tool_use

        # @!parse
        #   # @param id [String]
        #   # @param input [Object]
        #   # @param name [String]
        #   # @param type [Symbol, :tool_use]
        #   #
        #   def initialize(id:, input:, name:, type: :tool_use, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaToolUseBlock = Beta::BetaToolUseBlock
  end
end
