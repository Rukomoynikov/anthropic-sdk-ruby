# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaMessageParam < BaseModel
      # @!attribute [rw] content
      #   @return [Array<Anthropic::Models::PromptCachingBetaImageBlockParam, Anthropic::Models::PromptCachingBetaTextBlockParam, Anthropic::Models::PromptCachingBetaToolResultBlockParam, Anthropic::Models::PromptCachingBetaToolUseBlockParam>, String]
      required :content, Anthropic::Unknown

      # @!attribute [rw] role
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaMessageParam::Role]
      required :role, enum: -> { Anthropic::Models::PromptCachingBetaMessageParam::Role }

      class Role < Anthropic::Enum
        USER = :user
        ASSISTANT = :assistant
      end
    end
  end
end
