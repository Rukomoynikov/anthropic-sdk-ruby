# typed: strong

module Anthropic
  module Models
    class ModelRetrieveParams < Anthropic::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      sig do
        params(request_options: T.any(Anthropic::RequestOptions, Anthropic::Internal::Util::AnyHash))
          .returns(T.attached_class)
      end
      def self.new(request_options: {})
      end

      sig { override.returns({request_options: Anthropic::RequestOptions}) }
      def to_hash
      end
    end
  end
end
