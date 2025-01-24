# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_use_block => {
      #   id: String,
      #   input: Anthropic::Unknown,
      #   name: String,
      #   type: :tool_use
      # }
      # ```
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
        #   @return [Symbol, :tool_use]
        required :type, const: :tool_use

        # @!parse
        #   # @param id [String]
        #   # @param input [Object]
        #   # @param name [String]
        #   # @param type [String]
        #   #
        #   def initialize(id:, input:, name:, type: :tool_use, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaToolUseBlock = Beta::BetaToolUseBlock
  end
end
