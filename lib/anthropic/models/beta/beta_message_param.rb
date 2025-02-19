# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_message_param => {
      #   content: Anthropic::Models::Beta::BetaMessageParam::Content,
      #   role: Anthropic::Models::Beta::BetaMessageParam::Role
      # }
      # ```
      class BetaMessageParam < Anthropic::BaseModel
        # @!attribute content
        #
        #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock>]
        required :content, union: -> { Anthropic::Models::Beta::BetaMessageParam::Content }

        # @!attribute role
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        required :role, enum: -> { Anthropic::Models::Beta::BetaMessageParam::Role }

        # @!parse
        #   # @param content [String, Array<Anthropic::Models::Beta::BetaTextBlockParam, Anthropic::Models::Beta::BetaImageBlockParam, Anthropic::Models::Beta::BetaToolUseBlockParam, Anthropic::Models::Beta::BetaToolResultBlockParam, Anthropic::Models::Beta::BetaBase64PDFBlock>]
        #   # @param role [Symbol, Anthropic::Models::Beta::BetaMessageParam::Role]
        #   #
        #   def initialize(content:, role:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @abstract
        #
        # @example
        # ```ruby
        # case content
        # in String
        #   # ...
        # in Anthropic::Models::Beta::BetaMessageParam::Content::BetaContentBlockParamArray
        #   # ...
        # end
        # ```
        class Content < Anthropic::Union
          BetaContentBlockParamArray = Anthropic::ArrayOf[union: -> { Anthropic::Models::Beta::BetaContentBlockParam }]

          variant String

          variant Anthropic::Models::Beta::BetaMessageParam::Content::BetaContentBlockParamArray
        end

        # @abstract
        #
        # @example
        # ```ruby
        # case role
        # in :user
        #   # ...
        # in :assistant
        #   # ...
        # end
        # ```
        class Role < Anthropic::Enum
          USER = :user
          ASSISTANT = :assistant

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   #
          #   def self.values; end
        end
      end
    end

    BetaMessageParam = Beta::BetaMessageParam
  end
end
