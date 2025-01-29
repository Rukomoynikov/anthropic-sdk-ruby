# typed: strong

module Anthropic
  module Models
    class ModelInfo < Anthropic::BaseModel
      Shape = T.type_alias { {id: String, created_at: Time, display_name: String, type: Symbol} }

      sig { returns(String) }
      attr_accessor :id

      sig { returns(Time) }
      attr_accessor :created_at

      sig { returns(String) }
      attr_accessor :display_name

      sig { returns(Symbol) }
      attr_accessor :type

      sig { params(id: String, created_at: Time, display_name: String, type: Symbol).void }
      def initialize(id:, created_at:, display_name:, type: :model); end

      sig { returns(Anthropic::Models::ModelInfo::Shape) }
      def to_h; end
    end
  end
end
