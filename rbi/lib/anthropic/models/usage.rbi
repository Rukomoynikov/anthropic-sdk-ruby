# typed: strong

module Anthropic
  module Models
    class Usage < Anthropic::BaseModel
      sig { returns(T.nilable(Integer)) }
      def cache_creation_input_tokens
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def cache_creation_input_tokens=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def cache_read_input_tokens
      end

      sig { params(_: T.nilable(Integer)).returns(T.nilable(Integer)) }
      def cache_read_input_tokens=(_)
      end

      sig { returns(Integer) }
      def input_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def input_tokens=(_)
      end

      sig { returns(Integer) }
      def output_tokens
      end

      sig { params(_: Integer).returns(Integer) }
      def output_tokens=(_)
      end

      sig do
        params(
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          input_tokens: Integer,
          output_tokens: Integer
        ).void
      end
      def initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:)
      end

      sig do
        override.returns(
          {
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            input_tokens: Integer,
            output_tokens: Integer
          }
        )
      end
      def to_hash
      end
    end
  end
end
