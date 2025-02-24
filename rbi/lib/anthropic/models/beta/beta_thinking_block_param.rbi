# typed: strong

module Anthropic
  module Models
    BetaThinkingBlockParam = T.type_alias { Beta::BetaThinkingBlockParam }

    module Beta
      class BetaThinkingBlockParam < Anthropic::BaseModel
        sig { returns(String) }
        def signature
        end

        sig { params(_: String).returns(String) }
        def signature=(_)
        end

        sig { returns(String) }
        def thinking
        end

        sig { params(_: String).returns(String) }
        def thinking=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig { params(signature: String, thinking: String, type: Symbol).void }
        def initialize(signature:, thinking:, type: :thinking)
        end

        sig { override.returns({signature: String, thinking: String, type: Symbol}) }
        def to_hash
        end
      end
    end
  end
end
