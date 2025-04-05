# typed: strong

module Anthropic
  module Models
    class ToolChoiceNone < Anthropic::Internal::Type::BaseModel
      sig { returns(Symbol) }
      attr_accessor :type

      # The model will not be allowed to use tools.
      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(type: :none); end

      sig { override.returns({type: Symbol}) }
      def to_hash; end
    end
  end
end
