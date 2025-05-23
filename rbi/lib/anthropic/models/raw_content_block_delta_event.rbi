# typed: strong

module Anthropic
  module Models
    class RawContentBlockDeltaEvent < Anthropic::Internal::Type::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::TextDelta,
            Anthropic::Models::InputJSONDelta,
            Anthropic::Models::CitationsDelta,
            Anthropic::Models::ThinkingDelta,
            Anthropic::Models::SignatureDelta
          )
        )
      end
      attr_accessor :delta

      sig { returns(Integer) }
      attr_accessor :index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          delta: T.any(
            Anthropic::Models::TextDelta,
            Anthropic::Internal::AnyHash,
            Anthropic::Models::InputJSONDelta,
            Anthropic::Models::CitationsDelta,
            Anthropic::Models::ThinkingDelta,
            Anthropic::Models::SignatureDelta
          ),
          index: Integer,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(delta:, index:, type: :content_block_delta); end

      sig do
        override
          .returns(
            {
              delta: T.any(
                Anthropic::Models::TextDelta,
                Anthropic::Models::InputJSONDelta,
                Anthropic::Models::CitationsDelta,
                Anthropic::Models::ThinkingDelta,
                Anthropic::Models::SignatureDelta
              ),
              index: Integer,
              type: Symbol
            }
          )
      end
      def to_hash; end
    end
  end
end
