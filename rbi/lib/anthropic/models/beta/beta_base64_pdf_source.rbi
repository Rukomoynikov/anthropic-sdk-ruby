# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFSource < Anthropic::Internal::Type::BaseModel
        sig { returns(String) }
        attr_accessor :data

        sig { returns(Symbol) }
        attr_accessor :media_type

        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
        def self.new(data:, media_type: :"application/pdf", type: :base64); end

        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
        def to_hash; end
      end
    end

    BetaBase64PDFSource = Beta::BetaBase64PDFSource
  end
end
