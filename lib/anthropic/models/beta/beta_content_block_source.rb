# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaContentBlockSource < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        required :content, union: -> { Anthropic::Models::Beta::BetaContentBlockSource::Content }

        # @!attribute type
        #
        #   @return [Symbol, :content]
        required :type, const: :content

        # @!parse
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>]
        #   # @param type [Symbol, :content]
        #   #
        #   def initialize(content:, type: :content, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

        # @see Anthropic::Models::Beta::BetaContentBlockSource#content
        module Content
          extend Anthropic::Internal::Type::Union

          variant String

          variant -> { Anthropic::Models::Beta::BetaContentBlockSource::Content::BetaContentBlockSourceContentArray }

          # @!parse
          #   # @return [Array(String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam>)]
          #   def self.variants; end

          BetaContentBlockSourceContentArray =
            Anthropic::Internal::Type::ArrayOf[union: -> { Anthropic::Models::Beta::BetaContentBlockSourceContent }]
        end
      end
    end

    BetaContentBlockSource = Beta::BetaContentBlockSource
  end
end
