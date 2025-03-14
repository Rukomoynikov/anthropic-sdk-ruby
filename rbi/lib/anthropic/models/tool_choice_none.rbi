# typed: strong

module Anthropic
  module Models
    class ToolChoiceNone < Anthropic::BaseModel
      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      # The model will not be allowed to use tools.
      sig { params(type: Symbol).returns(T.attached_class) }
      def self.new(type: :none)
      end

      sig { override.returns({type: Symbol}) }
      def to_hash
      end
    end
  end
end
