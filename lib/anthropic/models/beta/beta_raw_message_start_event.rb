# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_raw_message_start_event => {
      #   message: Anthropic::Models::Beta::BetaMessage,
      #   type: Anthropic::Models::Beta::BetaRawMessageStartEvent::Type
      # }
      # ```
      class BetaRawMessageStartEvent < Anthropic::BaseModel
        # @!attribute message
        #
        #   @return [Anthropic::Models::Beta::BetaMessage]
        required :message, -> { Anthropic::Models::Beta::BetaMessage }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawMessageStartEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawMessageStartEvent::Type }

        # @!parse
        #   # @param message [Anthropic::Models::Beta::BetaMessage]
        #   # @param type [String]
        #   #
        #   def initialize(message:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :message_start
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          MESSAGE_START = :message_start

          finalize!
        end
      end
    end

    BetaRawMessageStartEvent = Beta::BetaRawMessageStartEvent
  end
end
