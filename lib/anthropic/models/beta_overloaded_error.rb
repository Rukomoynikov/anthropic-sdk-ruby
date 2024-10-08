# frozen_string_literal: true

module Anthropic
  module Models
    class BetaOverloadedError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaOverloadedError::Type]
      required :type, enum: -> { Anthropic::Models::BetaOverloadedError::Type }

      class Type < Anthropic::Enum
        OVERLOADED_ERROR = :overloaded_error
      end
    end
  end
end
