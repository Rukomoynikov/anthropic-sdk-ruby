# typed: strong

module Anthropic
  module Models
    class BetaAuthenticationError < Anthropic::BaseModel
      Shape = T.type_alias { {message: String, type: Symbol} }

      sig { returns(String) }
      attr_accessor :message

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(message: String, type: Symbol).void }
      def initialize(message:, type: :authentication_error); end

      sig { returns(Anthropic::Models::BetaAuthenticationError::Shape) }
      def to_h; end
    end
  end
end
