# frozen_string_literal: true

module Anthropic
  module Models
    class ThinkingConfigEnabled < Anthropic::Internal::Type::BaseModel
      # @!attribute budget_tokens
      #   Determines how many tokens Claude can use for its internal reasoning process.
      #   Larger budgets can enable more thorough analysis for complex problems, improving
      #   response quality.
      #
      #   Must be ≥1024 and less than `max_tokens`.
      #
      #   See
      #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
      #   for details.
      #
      #   @return [Integer]
      required :budget_tokens, Integer

      # @!attribute type
      #
      #   @return [Symbol, :enabled]
      required :type, const: :enabled

      # @!parse
      #   # @param budget_tokens [Integer]
      #   # @param type [Symbol, :enabled]
      #   #
      #   def initialize(budget_tokens:, type: :enabled, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
