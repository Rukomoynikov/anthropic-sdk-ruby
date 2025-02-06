# typed: strong

module Anthropic
  module Models
    class ToolResultBlockParam < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :tool_use_id

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig do
        returns(
          T.nilable(
            T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::TextBlockParam,
                Anthropic::Models::ImageBlockParam
              )]
            )
          )
        )
      end
      attr_reader :content

      sig do
        params(
          content: T.any(
            String,
            T::Array[T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam
            )]
          )
        ).void
      end
      attr_writer :content

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_error

      sig { params(is_error: T::Boolean).void }
      attr_writer :is_error

      sig do
        params(
          tool_use_id: String,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          content: T.any(
            String,
            T::Array[T.any(
              Anthropic::Models::TextBlockParam,
              Anthropic::Models::ImageBlockParam
            )]
          ),
          is_error: T::Boolean,
          type: Symbol
        ).void
      end
      def initialize(tool_use_id:, cache_control: nil, content: nil, is_error: nil, type: :tool_result)
      end

      sig do
        override.returns(
          {
            tool_use_id: String,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
            content: T.any(
              String,
              T::Array[T.any(
                Anthropic::Models::TextBlockParam,
                Anthropic::Models::ImageBlockParam
              )]
            ),
            is_error: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Content < Anthropic::Union
        abstract!

        ContentArray = T.type_alias do
          T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
        end

        class Content < Anthropic::Union
          abstract!

          sig do
            override.returns(
              [
                [Symbol, Anthropic::Models::TextBlockParam],
                [Symbol, Anthropic::Models::ImageBlockParam]
              ]
            )
          end
          private_class_method def self.variants
          end
        end

        sig do
          override.returns(
            [
              [NilClass, String],
              [
                NilClass,
                T::Array[T.any(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]
              ]
            ]
          )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
