# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # citation_content_block_location => {
    #   cited_text: String,
    #   document_index: Integer,
    #   document_title: String,
    #   end_block_index: Integer,
    #   start_block_index: Integer
    # }
    # ```
    class CitationContentBlockLocation < Anthropic::BaseModel
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

      # @!attribute end_block_index
      #
      #   @return [Integer]
      required :end_block_index, Integer

      # @!attribute start_block_index
      #
      #   @return [Integer]
      required :start_block_index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :content_block_location]
      required :type, const: :content_block_location

      # @!parse
      #   # @param cited_text [String]
      #   # @param document_index [Integer]
      #   # @param document_title [String, nil]
      #   # @param end_block_index [Integer]
      #   # @param start_block_index [Integer]
      #   # @param type [Symbol, :content_block_location]
      #   #
      #   def initialize(
      #     cited_text:,
      #     document_index:,
      #     document_title:,
      #     end_block_index:,
      #     start_block_index:,
      #     type: :content_block_location,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
