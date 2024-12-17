# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class MessageBatchSucceededResult < Anthropic::BaseModel
        # @!attribute message
        #
        #   @return [Anthropic::Models::Message]
        required :message, -> { Anthropic::Models::Message }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Messages::MessageBatchSucceededResult::Type]
        required :type, enum: -> { Anthropic::Models::Messages::MessageBatchSucceededResult::Type }

        # @!parse
        #   # @param message [Anthropic::Models::Message]
        #   # @param type [String]
        #   #
        #   def initialize(message:, type:) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :succeeded
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          SUCCEEDED = :succeeded
        end
      end
    end

    MessageBatchSucceededResult = Messages::MessageBatchSucceededResult
  end
end
