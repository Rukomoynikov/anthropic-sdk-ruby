# frozen_string_literal: true

module Anthropic
  module Models
    class BetaPermissionError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :permission_error]
      required :type, const: :permission_error

      # @!parse
      #   # @param message [String]
      #   # @param type [Symbol, :permission_error]
      #   #
      #   def initialize(message:, type: :permission_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
