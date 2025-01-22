# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_choice_tool => {
      #   name: String,
      #   type: Anthropic::Models::Beta::BetaToolChoiceTool::Type,
      #   disable_parallel_tool_use: Anthropic::BooleanModel
      # }
      # ```
      class BetaToolChoiceTool < Anthropic::BaseModel
        # @!attribute name
        #   The name of the tool to use.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolChoiceTool::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolChoiceTool::Type }

        # @!attribute [r] disable_parallel_tool_use
        #   Whether to disable parallel tool use.
        #
        #     Defaults to `false`. If set to `true`, the model will output exactly one tool
        #     use.
        #
        #   @return [Boolean, nil]
        optional :disable_parallel_tool_use, Anthropic::BooleanModel

        # @!parse
        #   # @return [Boolean]
        #   attr_writer :disable_parallel_tool_use

        # @!parse
        #   # The model will use the specified tool with `tool_choice.name`.
        #   #
        #   # @param name [String]
        #   # @param type [String]
        #   # @param disable_parallel_tool_use [Boolean]
        #   #
        #   def initialize(name:, type:, disable_parallel_tool_use: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :tool
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TOOL = :tool

          finalize!
        end
      end
    end

    BetaToolChoiceTool = Beta::BetaToolChoiceTool
  end
end
