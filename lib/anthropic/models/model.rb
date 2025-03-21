# frozen_string_literal: true

module Anthropic
  module Models
    # The model that will complete your prompt.\n\nSee
    #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
    #   details and options.
    module Model
      extend Anthropic::Union

      # @!group

      # Our most intelligent model
      CLAUDE_3_7_SONNET_LATEST = :"claude-3-7-sonnet-latest"

      # Our most intelligent model
      CLAUDE_3_7_SONNET_20250219 = :"claude-3-7-sonnet-20250219"

      # Fastest and most compact model for near-instant responsiveness
      CLAUDE_3_5_HAIKU_LATEST = :"claude-3-5-haiku-latest"

      # Our fastest model
      CLAUDE_3_5_HAIKU_20241022 = :"claude-3-5-haiku-20241022"

      # Our previous most intelligent model
      CLAUDE_3_5_SONNET_LATEST = :"claude-3-5-sonnet-latest"

      # Our previous most intelligent model
      CLAUDE_3_5_SONNET_20241022 = :"claude-3-5-sonnet-20241022"

      CLAUDE_3_5_SONNET_20240620 = :"claude-3-5-sonnet-20240620"

      # Excels at writing and complex tasks
      CLAUDE_3_OPUS_LATEST = :"claude-3-opus-latest"

      # Excels at writing and complex tasks
      CLAUDE_3_OPUS_20240229 = :"claude-3-opus-20240229"

      # Balance of speed and intelligence
      # @deprecated Will reach end-of-life on July 21st, 2025. Please migrate to a newer model.
      #   Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      #   information.
      CLAUDE_3_SONNET_20240229 = :"claude-3-sonnet-20240229"

      # Our previous most fast and cost-effective
      CLAUDE_3_HAIKU_20240307 = :"claude-3-haiku-20240307"

      # @deprecated Will reach end-of-life on July 21st, 2025. Please migrate to a newer model.
      #   Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      #   information.
      CLAUDE_2_1 = :"claude-2.1"

      # @deprecated Will reach end-of-life on July 21st, 2025. Please migrate to a newer model.
      #   Visit https://docs.anthropic.com/en/docs/resources/model-deprecations for more
      #   information.
      CLAUDE_2_0 = :"claude-2.0"

      # @!endgroup

      variant const: Anthropic::Models::Model::CLAUDE_3_7_SONNET_LATEST

      variant const: Anthropic::Models::Model::CLAUDE_3_7_SONNET_20250219

      variant const: Anthropic::Models::Model::CLAUDE_3_5_HAIKU_LATEST

      variant const: Anthropic::Models::Model::CLAUDE_3_5_HAIKU_20241022

      variant const: Anthropic::Models::Model::CLAUDE_3_5_SONNET_LATEST

      variant const: Anthropic::Models::Model::CLAUDE_3_5_SONNET_20241022

      variant const: Anthropic::Models::Model::CLAUDE_3_5_SONNET_20240620

      variant const: Anthropic::Models::Model::CLAUDE_3_OPUS_LATEST

      variant const: Anthropic::Models::Model::CLAUDE_3_OPUS_20240229

      variant const: Anthropic::Models::Model::CLAUDE_3_SONNET_20240229

      variant const: Anthropic::Models::Model::CLAUDE_3_HAIKU_20240307

      variant const: Anthropic::Models::Model::CLAUDE_2_1

      variant const: Anthropic::Models::Model::CLAUDE_2_0

      variant String

      # @!parse
      #   # @return [Array(Symbol, String)]
      #   def self.variants; end
    end
  end
end
