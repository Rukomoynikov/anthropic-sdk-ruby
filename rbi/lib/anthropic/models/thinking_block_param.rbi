# typed: strong

module Anthropic
  module Models
    class ThinkingBlockParam < Anthropic::Internal::Type::BaseModel
      sig { returns(String) }
      attr_accessor :signature

      sig { returns(String) }
      attr_accessor :thinking

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(signature: String, thinking: String, type: Symbol).returns(T.attached_class) }
      def self.new(signature:, thinking:, type: :thinking); end

      sig { override.returns({signature: String, thinking: String, type: Symbol}) }
      def to_hash; end
    end
  end
end
