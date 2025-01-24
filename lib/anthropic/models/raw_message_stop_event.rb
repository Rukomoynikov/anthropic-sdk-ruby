# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # raw_message_stop_event => {
    #   type: :message_stop
    # }
    # ```
    class RawMessageStopEvent < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :message_stop]
      required :type, const: :message_stop

      # @!parse
      #   # @param type [String]
      #   #
      #   def initialize(type: :message_stop, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
