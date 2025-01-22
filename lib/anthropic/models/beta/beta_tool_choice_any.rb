# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_choice_any => {
      #   type: Anthropic::Models::Beta::BetaToolChoiceAny::Type,
      #   disable_parallel_tool_use: Anthropic::BooleanModel
      # }
      # ```
      class BetaToolChoiceAny < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolChoiceAny::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolChoiceAny::Type }

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
        #   # The model will use any available tools.
        #   #
        #   # @param type [String]
        #   # @param disable_parallel_tool_use [Boolean]
        #   #
        #   def initialize(type:, disable_parallel_tool_use: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :any
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          ANY = :any

          finalize!
        end
      end
    end

    BetaToolChoiceAny = Beta::BetaToolChoiceAny
  end
end
