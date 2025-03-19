# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFSource < Anthropic::BaseModel
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

        sig { params(data: String, media_type: Symbol, type: Symbol).returns(T.attached_class) }
        def self.new(data:, media_type: :"application/pdf", type: :base64)
        end

        sig { override.returns({data: String, media_type: Symbol, type: Symbol}) }
        def to_hash
        end
      end
    end

    BetaBase64PDFSource = Beta::BetaBase64PDFSource
  end
end
