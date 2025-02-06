# typed: strong

module Anthropic
  module Models
    class MessageParam < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            String,
            T::Array[T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam,
              Anthropic::Models::ToolUseBlockParam,
              Anthropic::Models::ToolResultBlockParam,
              Anthropic::Models::DocumentBlockParam
            )]
          )
        )
      end
      attr_accessor :content

      sig { returns(Symbol) }
      attr_accessor :role

      sig do
        params(
          content: T.any(
            String,
            T::Array[T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam,
              Anthropic::Models::ToolUseBlockParam,
              Anthropic::Models::ToolResultBlockParam,
              Anthropic::Models::DocumentBlockParam
            )]
          ),
          role: Symbol
        ).void
      end
      def initialize(content:, role:); end

      sig do
        override.returns(
          {
            content: T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::TextBlockParam,
                Anthropic::Models::ImageBlockParam,
                Anthropic::Models::ToolUseBlockParam,
                Anthropic::Models::ToolResultBlockParam,
                Anthropic::Models::DocumentBlockParam
              )]
            ),
            role: Symbol
          }
        )
      end
      def to_hash; end

      class Content < Anthropic::Union
        abstract!

        ContentBlockParamArray = T.type_alias do
          T::Array[T.any(
            Anthropic::Models::TextBlockParam,
            Anthropic::Models::ImageBlockParam,
            Anthropic::Models::ToolUseBlockParam,
            Anthropic::Models::ToolResultBlockParam,
            Anthropic::Models::DocumentBlockParam
          )]
        end

        sig do
          override.returns(
            [
              [NilClass, String],
              [
                NilClass,
                T::Array[T.any(
                  Anthropic::Models::TextBlockParam,
                  Anthropic::Models::ImageBlockParam,
                  Anthropic::Models::ToolUseBlockParam,
                  Anthropic::Models::ToolResultBlockParam,
                  Anthropic::Models::DocumentBlockParam
                )]
              ]
            ]
          )
        end
        private_class_method def self.variants; end
      end

      class Role < Anthropic::Enum
        abstract!

        USER = :user
        ASSISTANT = :assistant

        sig { override.returns(T::Array[Symbol]) }
        def self.values; end
      end
    end
  end
end
