# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageStopEvent < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawMessageStopEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawMessageStopEvent::Type }

        # @!parse
        #   # @param type [String]
        #   #
        #   def initialize(type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :message_stop
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          MESSAGE_STOP = :message_stop

          finalize!
        end
      end
    end

    BetaRawMessageStopEvent = Beta::BetaRawMessageStopEvent
  end
end
