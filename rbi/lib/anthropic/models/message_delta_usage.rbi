# typed: strong

module Anthropic
  module Models
    class MessageDeltaUsage < Anthropic::BaseModel
      sig { returns(Integer) }
      def output_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def output_tokens=(_)
      end

      sig { params(output_tokens: Integer).returns(T.attached_class) }
      def self.new(output_tokens:)
      end

      sig { override.returns({output_tokens: Integer}) }
      def to_hash
      end
    end
  end
end
