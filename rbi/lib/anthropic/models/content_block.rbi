# typed: strong

module Anthropic
  module Models
    class ContentBlock < Anthropic::Union
      abstract!

      sig do
        override
          .returns(
            [[Symbol, Anthropic::Models::TextBlock], [Symbol, Anthropic::Models::ToolUseBlock], [Symbol, Anthropic::Models::ThinkingBlock], [Symbol, Anthropic::Models::RedactedThinkingBlock]]
          )
      end
      private_class_method def self.variants
      end
    end
  end
end
