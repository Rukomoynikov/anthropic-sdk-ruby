# typed: strong

module Anthropic
  module Models
    BetaToolUnion = T.type_alias { Beta::BetaToolUnion }

    module Beta
      class BetaToolUnion < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
