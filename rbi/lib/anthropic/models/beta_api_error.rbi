# typed: strong

module Anthropic
  module Models
    class BetaAPIError < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).void }
      def initialize(message:, type: :api_error)
      end

      sig { override.returns({message: String, type: Symbol}) }
      def to_hash
      end
    end
  end
end
