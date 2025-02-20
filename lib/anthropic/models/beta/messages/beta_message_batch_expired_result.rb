# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchExpiredResult < Anthropic::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :expired]
          required :type, const: :expired

          # @!parse
          #   # @param type [Symbol, :expired]
          #   #
          #   def initialize(type: :expired, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
