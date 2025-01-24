# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_text_block_param => {
      #   text: String,
      #   type: :text,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral,
      #   citations: -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitationParam] === _1 }
      # }
      # ```
      class BetaTextBlockParam < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute citations
        #
        #   @return [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam>]
        optional :citations,
                 -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaTextCitationParam] },
                 nil?: true

        # @!parse
        #   # @param text [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam>]
        #   # @param type [String]
        #   #
        #   def initialize(text:, cache_control: nil, citations: nil, type: :text, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaTextBlockParam = Beta::BetaTextBlockParam
  end
end
