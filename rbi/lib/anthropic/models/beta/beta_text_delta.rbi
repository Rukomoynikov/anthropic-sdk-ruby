# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaTextDelta < Anthropic::Internal::Type::BaseModel
        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(text: String, type: Symbol).returns(T.attached_class) }
        def self.new(text:, type: :text_delta); end

        sig { override.returns({text: String, type: Symbol}) }
        def to_hash; end
      end
    end

    BetaTextDelta = Beta::BetaTextDelta
  end
end
