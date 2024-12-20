# frozen_string_literal: true

module Anthropic
  module Models
    class BetaOverloadedError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaOverloadedError::Type]
      required :type, enum: -> { Anthropic::Models::BetaOverloadedError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :overloaded_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        OVERLOADED_ERROR = :overloaded_error

        finalize!
      end
    end
  end
end
