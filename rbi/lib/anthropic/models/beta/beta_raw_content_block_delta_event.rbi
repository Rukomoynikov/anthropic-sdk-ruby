# typed: strong

module Anthropic
  module Models
    BetaRawContentBlockDeltaEvent = T.type_alias { Beta::BetaRawContentBlockDeltaEvent }

    module Beta
      class BetaRawContentBlockDeltaEvent < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta
            )
          )
        end
        def delta
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta
            )
          ).returns(T.any(
                      Anthropic::Models::Beta::BetaTextDelta,
                      Anthropic::Models::Beta::BetaInputJSONDelta,
                      Anthropic::Models::Beta::BetaCitationsDelta
                    ))
        end
        def delta=(_)
        end

        sig { returns(Integer) }
        def index
        end

        sig { params(_: Integer).returns(Integer) }
        def index=(_)
        end

        sig { returns(Symbol) }
        def type
        end

        sig { params(_: Symbol).returns(Symbol) }
        def type=(_)
        end

        sig do
          params(
            delta: T.any(
              Anthropic::Models::Beta::BetaTextDelta,
              Anthropic::Models::Beta::BetaInputJSONDelta,
              Anthropic::Models::Beta::BetaCitationsDelta
            ),
            index: Integer,
            type: Symbol
          ).void
        end
        def initialize(delta:, index:, type: :content_block_delta)
        end

        sig do
          override.returns(
            {
              delta: T.any(
                Anthropic::Models::Beta::BetaTextDelta,
                Anthropic::Models::Beta::BetaInputJSONDelta,
                Anthropic::Models::Beta::BetaCitationsDelta
              ),
              index: Integer,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        class Delta < Anthropic::Union
          abstract!

          sig do
            override.returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaTextDelta],
                [Symbol, Anthropic::Models::Beta::BetaInputJSONDelta],
                [Symbol, Anthropic::Models::Beta::BetaCitationsDelta]
              ]
            )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
