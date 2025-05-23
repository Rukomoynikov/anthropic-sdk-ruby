# frozen_string_literal: true

module Anthropic
  module Models
    class CitationsDelta < Anthropic::Internal::Type::BaseModel
      # @!attribute citation
      #
      #   @return [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
      required :citation, union: -> { Anthropic::Models::CitationsDelta::Citation }

      # @!attribute type
      #
      #   @return [Symbol, :citations_delta]
      required :type, const: :citations_delta

      # @!parse
      #   # @param citation [Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation]
      #   # @param type [Symbol, :citations_delta]
      #   #
      #   def initialize(citation:, type: :citations_delta, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

      # @see Anthropic::Models::CitationsDelta#citation
      module Citation
        extend Anthropic::Internal::Type::Union

        discriminator :type

        variant :char_location, -> { Anthropic::Models::CitationCharLocation }

        variant :page_location, -> { Anthropic::Models::CitationPageLocation }

        variant :content_block_location, -> { Anthropic::Models::CitationContentBlockLocation }

        # @!parse
        #   # @return [Array(Anthropic::Models::CitationCharLocation, Anthropic::Models::CitationPageLocation, Anthropic::Models::CitationContentBlockLocation)]
        #   def self.variants; end
      end
    end
  end
end
