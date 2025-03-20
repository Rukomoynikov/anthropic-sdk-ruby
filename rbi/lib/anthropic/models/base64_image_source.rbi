# typed: strong

module Anthropic
  module Models
    class Base64ImageSource < Anthropic::BaseModel
      sig { returns(String) }
      def data
      end

      sig { params(_: String).returns(String) }
      def data=(_)
      end

      sig { returns(Anthropic::Models::Base64ImageSource::MediaType::OrSymbol) }
      def media_type
      end

      sig do
        params(_: Anthropic::Models::Base64ImageSource::MediaType::OrSymbol)
          .returns(Anthropic::Models::Base64ImageSource::MediaType::OrSymbol)
      end
      def media_type=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(data: String, media_type: Anthropic::Models::Base64ImageSource::MediaType::OrSymbol, type: Symbol)
          .returns(T.attached_class)
      end
      def self.new(data:, media_type:, type: :base64)
      end

      sig do
        override
          .returns(
            {data: String, media_type: Anthropic::Models::Base64ImageSource::MediaType::OrSymbol, type: Symbol}
          )
      end
      def to_hash
      end

      module MediaType
        extend Anthropic::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::Base64ImageSource::MediaType) }
        OrSymbol = T.type_alias { T.any(Symbol, Anthropic::Models::Base64ImageSource::MediaType::TaggedSymbol) }

        IMAGE_JPEG = T.let(:"image/jpeg", Anthropic::Models::Base64ImageSource::MediaType::OrSymbol)
        IMAGE_PNG = T.let(:"image/png", Anthropic::Models::Base64ImageSource::MediaType::OrSymbol)
        IMAGE_GIF = T.let(:"image/gif", Anthropic::Models::Base64ImageSource::MediaType::OrSymbol)
        IMAGE_WEBP = T.let(:"image/webp", Anthropic::Models::Base64ImageSource::MediaType::OrSymbol)
      end
    end
  end
end
