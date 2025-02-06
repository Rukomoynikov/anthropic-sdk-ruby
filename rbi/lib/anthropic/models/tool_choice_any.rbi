# typed: strong

module Anthropic
  module Models
    class ToolChoiceAny < Anthropic::BaseModel
      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :disable_parallel_tool_use

      sig { params(disable_parallel_tool_use: T::Boolean).void }
      attr_writer :disable_parallel_tool_use

      sig { params(disable_parallel_tool_use: T::Boolean, type: Symbol).void }
      def initialize(disable_parallel_tool_use: nil, type: :any); end

      sig { override.returns({type: Symbol, disable_parallel_tool_use: T::Boolean}) }
      def to_hash; end
    end
  end
end
