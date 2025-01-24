# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # invalid_request_error => {
    #   message: String,
    #   type: :invalid_request_error
    # }
    # ```
    class InvalidRequestError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, :invalid_request_error]
      required :type, const: :invalid_request_error

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type: :invalid_request_error, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
