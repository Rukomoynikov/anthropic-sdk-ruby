# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_citation_char_location_param => {
      #   cited_text: String,
      #   document_index: Integer,
      #   document_title: String,
      #   end_char_index: Integer,
      #   start_char_index: Integer
      # }
      # ```
      class BetaCitationCharLocationParam < Anthropic::BaseModel
        # @!attribute cited_text
        #
        #   @return [String]
        required :cited_text, String

        # @!attribute document_index
        #
        #   @return [Integer]
        required :document_index, Integer

        # @!attribute document_title
        #
        #   @return [String, nil]
        required :document_title, String, nil?: true

        # @!attribute end_char_index
        #
        #   @return [Integer]
        required :end_char_index, Integer

        # @!attribute start_char_index
        #
        #   @return [Integer]
        required :start_char_index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :char_location]
        required :type, const: :char_location

        # @!parse
        #   # @param cited_text [String]
        #   # @param document_index [Integer]
        #   # @param document_title [String, nil]
        #   # @param end_char_index [Integer]
        #   # @param start_char_index [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(
        #     cited_text:,
        #     document_index:,
        #     document_title:,
        #     end_char_index:,
        #     start_char_index:,
        #     type: :char_location,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaCitationCharLocationParam = Beta::BetaCitationCharLocationParam
  end
end
