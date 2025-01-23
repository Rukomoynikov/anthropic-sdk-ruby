# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_text_block_param => {
      #   text: String,
      #   type: Anthropic::Models::Beta::BetaTextBlockParam::Type,
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
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlockParam::Type }

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
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param citations [Array<Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam>]
        #   #
        #   def initialize(text:, type:, cache_control: nil, citations: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :text
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT = :text

          finalize!
        end
      end
    end

    BetaTextBlockParam = Beta::BetaTextBlockParam
  end
end
