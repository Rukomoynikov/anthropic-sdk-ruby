# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # plain_text_source => {
    #   data: String,
    #   media_type: :"text/plain",
    #   type: :text
    # }
    # ```
    class PlainTextSource < Anthropic::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute media_type
      #
      #   @return [Symbol, :"text/plain"]
      required :media_type, const: :"text/plain"

      # @!attribute type
      #
      #   @return [Symbol, :text]
      required :type, const: :text

      # @!parse
      #   # @param data [String]
      #   # @param media_type [String]
      #   # @param type [String]
      #   #
      #   def initialize(data:, media_type: :"text/plain", type: :text, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
