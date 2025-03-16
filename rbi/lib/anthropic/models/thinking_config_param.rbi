# typed: strong

module Anthropic
  module Models
    # Configuration for enabling Claude's extended thinking.
    #
    #   When enabled, responses include `thinking` content blocks showing Claude's
    #   thinking process before the final answer. Requires a minimum budget of 1,024
    #   tokens and counts towards your `max_tokens` limit.
    #
    #   See
    #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
    #   for details.
    class ThinkingConfigParam < Anthropic::Union
      abstract!

      Variants = type_template(:out) { {fixed: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled)} }
    end
  end
end
