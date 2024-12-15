# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFSource < Anthropic::BaseModel
        # @!attribute data
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFSource::MediaType]
        required :media_type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFSource::MediaType }

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFSource::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFSource::Type }

        class MediaType < Anthropic::Enum
          APPLICATION_PDF = :"application/pdf"
        end

        class Type < Anthropic::Enum
          BASE64 = :base64
        end

        # @!parse
        #   # Create a new instance of BetaBase64PDFSource from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :data
        #   #   @option data [String] :media_type
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaBase64PDFSource = Beta::BetaBase64PDFSource
  end
end
