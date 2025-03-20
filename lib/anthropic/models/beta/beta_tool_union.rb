# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaToolUnion
        extend Anthropic::Union

        variant -> { Anthropic::Models::Beta::BetaTool }

        variant -> { Anthropic::Models::Beta::BetaToolComputerUse20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolBash20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolTextEditor20241022 }

        variant -> { Anthropic::Models::Beta::BetaToolComputerUse20250124 }

        variant -> { Anthropic::Models::Beta::BetaToolBash20250124 }

        variant -> { Anthropic::Models::Beta::BetaToolTextEditor20250124 }

        # @!parse
        #   class << self
        #     # @return [Array(Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124)]
        #     def variants; end
        #   end
      end
    end

    BetaToolUnion = Beta::BetaToolUnion
  end
end
