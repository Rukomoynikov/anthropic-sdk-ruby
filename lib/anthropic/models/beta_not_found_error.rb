# frozen_string_literal: true

module Anthropic
  module Models
    class BetaNotFoundError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaNotFoundError::Type]
      required :type, enum: -> { Anthropic::Models::BetaNotFoundError::Type }

      class Type < Anthropic::Enum
        NOT_FOUND_ERROR = :not_found_error
      end
    end
  end
end
