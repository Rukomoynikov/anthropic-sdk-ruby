# typed: strong

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::BaseModel
      sig { returns(Anthropic::Models::RawMessageDeltaEvent::Delta) }
      attr_accessor :delta

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(Anthropic::Models::MessageDeltaUsage) }
      attr_accessor :usage

      sig do
        params(
          delta: Anthropic::Models::RawMessageDeltaEvent::Delta,
          usage: Anthropic::Models::MessageDeltaUsage,
          type: Symbol
        ).void
      end
      def initialize(delta:, usage:, type: :message_delta)
      end

      sig do
        override.returns(
          {
            delta: Anthropic::Models::RawMessageDeltaEvent::Delta,
            type: Symbol,
            usage: Anthropic::Models::MessageDeltaUsage
          }
        )
      end
      def to_hash
      end

      class Delta < Anthropic::BaseModel
        sig { returns(T.nilable(Symbol)) }
        attr_accessor :stop_reason

        sig { returns(T.nilable(String)) }
        attr_accessor :stop_sequence

        sig { params(stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)).void }
        def initialize(stop_reason:, stop_sequence:)
        end

        sig { override.returns({stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)}) }
        def to_hash
        end

        class StopReason < Anthropic::Enum
          abstract!

          END_TURN = T.let(:end_turn, T.nilable(Symbol))
          MAX_TOKENS = T.let(:max_tokens, T.nilable(Symbol))
          STOP_SEQUENCE = T.let(:stop_sequence, T.nilable(Symbol))
          TOOL_USE = T.let(:tool_use, T.nilable(Symbol))

          sig { override.returns(T::Array[Symbol]) }
          def self.values
          end
        end
      end
    end
  end
end
