# typed: strong

module Anthropic
  module Models
    BetaRedactedThinkingBlock = T.type_alias { Beta::BetaRedactedThinkingBlock }

    module Beta
      class BetaRedactedThinkingBlock < Anthropic::BaseModel
        sig { returns(String) }
        def data
        end

        sig { params(_: String).returns(String) }
        def data=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(data: String, type: Symbol).void }
        def initialize(data:, type: :redacted_thinking)
        end

        sig { override.returns({data: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
