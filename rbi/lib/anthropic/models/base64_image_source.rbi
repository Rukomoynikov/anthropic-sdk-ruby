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

      sig { returns(Symbol) }
      def media_type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def media_type=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { params(data: String, media_type: Symbol, type: Symbol).void }
      def initialize(data:, media_type:, type: :base64)
      end

      sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
      def to_hash
      end

      class MediaType < Anthropic::Enum
        abstract!

        IMAGE_JPEG = :"image/jpeg"
        IMAGE_PNG = :"image/png"
        IMAGE_GIF = :"image/gif"
        IMAGE_WEBP = :"image/webp"

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
