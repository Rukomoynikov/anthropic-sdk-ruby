# typed: strong

module Anthropic
  module Models
    class PlainTextSource < Anthropic::BaseModel
      Shape = T.type_alias { {data: String, media_type: Symbol, type: Symbol} }

      sig { returns(String) }
      attr_accessor :data

      sig { returns(Symbol) }
      attr_accessor :media_type

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(data: String, media_type: Symbol, type: Symbol).void }
      def initialize(data:, media_type: :"text/plain", type: :text); end

      sig { returns(Anthropic::Models::PlainTextSource::Shape) }
      def to_h; end
    end
  end
end
