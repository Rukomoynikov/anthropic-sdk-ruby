# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaMessage < Anthropic::BaseModel
        # @!attribute id
        #   Unique object identifier.
        #
        # The format and length of IDs may change over time.
        #   @return [String]
        required :id, String

        # @!attribute content
        #   Content generated by the model.
        #
        # This is an array of content blocks, each of which has a `type` that determines its shape.
        #
        # Example:
        #
        # ```json
        # [{"type": "text", "text": "Hi, I'm Claude."}]
        # ```
        #
        # If the request input `messages` ended with an `assistant` turn, then the response `content` will continue directly from that last turn. You can use this to constrain the model's output.
        #
        # For example, if the input `messages` were:
        # ```json
        # [
        #   {"role": "user", "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"},
        #   {"role": "assistant", "content": "The best answer is ("}
        # ]
        # ```
        #
        # Then the response `content` might be:
        #
        # ```json
        # [{"type": "text", "text": "B)"}]
        # ```
        #   @return [Array<Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock>]
        required :content, Anthropic::ArrayOf.new(Anthropic::Unknown)

        # @!attribute model
        #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
        #   @return [String, Symbol, Anthropic::Models::Model::UnnamedTypeWithunionParent17]
        required :model, Anthropic::Unknown

        # @!attribute role
        #   Conversational role of the generated message.
        #
        # This will always be `"assistant"`.
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessage::Role]
        required :role, enum: -> { Anthropic::Models::Beta::BetaMessage::Role }

        # @!attribute stop_reason
        #   The reason that we stopped.
        #
        # This may be one the following values:
        # * `"end_turn"`: the model reached a natural stopping point
        # * `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
        # * `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
        # * `"tool_use"`: the model invoked one or more tools
        #
        # In non-streaming mode this value is always non-null. In streaming mode, it is null in the `message_start` event and non-null otherwise.
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessage::StopReason]
        required :stop_reason, enum: -> { Anthropic::Models::Beta::BetaMessage::StopReason }

        # @!attribute stop_sequence
        #   Which custom stop sequence was generated, if any.
        #
        # This value will be a non-null string if one of your custom stop sequences was generated.
        #   @return [String]
        required :stop_sequence, String

        # @!attribute type
        #   Object type.
        #
        # For Messages, this is always `"message"`.
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessage::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaMessage::Type }

        # @!attribute usage
        #   Billing and rate-limit usage.
        #
        # Anthropic's API bills and rate-limits by token counts, as tokens represent the underlying cost to our systems.
        #
        # Under the hood, the API transforms requests into a format suitable for the model. The model's output then goes through a parsing stage before becoming an API response. As a result, the token counts in `usage` will not match one-to-one with the exact visible content of an API request or response.
        #
        # For example, `output_tokens` will be non-zero, even for an empty string response from Claude.
        #   @return [Anthropic::Models::Beta::BetaUsage]
        required :usage, -> { Anthropic::Models::Beta::BetaUsage }

        # Conversational role of the generated message.
        #
        # This will always be `"assistant"`.
        class Role < Anthropic::Enum
          ASSISTANT = :assistant
        end

        # The reason that we stopped.
        #
        # This may be one the following values:
        # * `"end_turn"`: the model reached a natural stopping point
        # * `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
        # * `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
        # * `"tool_use"`: the model invoked one or more tools
        #
        # In non-streaming mode this value is always non-null. In streaming mode, it is null in the `message_start` event and non-null otherwise.
        class StopReason < Anthropic::Enum
          END_TURN = :end_turn
          MAX_TOKENS = :max_tokens
          STOP_SEQUENCE = :stop_sequence
          TOOL_USE = :tool_use
        end

        # Object type.
        #
        # For Messages, this is always `"message"`.
        class Type < Anthropic::Enum
          MESSAGE = :message
        end

        # @!parse
        #   # Create a new instance of BetaMessage from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :id Unique object identifier.
        #   #
        #   #     The format and length of IDs may change over time.
        #   #   @option data [Array<Object>] :content Content generated by the model.
        #   #
        #   #     This is an array of content blocks, each of which has a `type` that determines
        #   #     its shape.
        #   #
        #   #     Example:
        #   #
        #   #     ```json
        #   #     [{ "type": "text", "text": "Hi, I'm Claude." }]
        #   #     ```
        #   #
        #   #     If the request input `messages` ended with an `assistant` turn, then the
        #   #     response `content` will continue directly from that last turn. You can use this
        #   #     to constrain the model's output.
        #   #
        #   #     For example, if the input `messages` were:
        #   #
        #   #     ```json
        #   #     [
        #   #       {
        #   #         "role": "user",
        #   #         "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
        #   #       },
        #   #       { "role": "assistant", "content": "The best answer is (" }
        #   #     ]
        #   #     ```
        #   #
        #   #     Then the response `content` might be:
        #   #
        #   #     ```json
        #   #     [{ "type": "text", "text": "B)" }]
        #   #     ```
        #   #   @option data [String] :model The model that will complete your prompt.\n\nSee
        #   #     [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   #     details and options.
        #   #   @option data [String] :role Conversational role of the generated message.
        #   #
        #   #     This will always be `"assistant"`.
        #   #   @option data [String] :stop_reason The reason that we stopped.
        #   #
        #   #     This may be one the following values:
        #   #
        #   #     - `"end_turn"`: the model reached a natural stopping point
        #   #     - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
        #   #     - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
        #   #     - `"tool_use"`: the model invoked one or more tools
        #   #
        #   #     In non-streaming mode this value is always non-null. In streaming mode, it is
        #   #     null in the `message_start` event and non-null otherwise.
        #   #   @option data [String] :stop_sequence Which custom stop sequence was generated, if any.
        #   #
        #   #     This value will be a non-null string if one of your custom stop sequences was
        #   #     generated.
        #   #   @option data [String] :type Object type.
        #   #
        #   #     For Messages, this is always `"message"`.
        #   #   @option data [Object] :usage Billing and rate-limit usage.
        #   #
        #   #     Anthropic's API bills and rate-limits by token counts, as tokens represent the
        #   #     underlying cost to our systems.
        #   #
        #   #     Under the hood, the API transforms requests into a format suitable for the
        #   #     model. The model's output then goes through a parsing stage before becoming an
        #   #     API response. As a result, the token counts in `usage` will not match one-to-one
        #   #     with the exact visible content of an API request or response.
        #   #
        #   #     For example, `output_tokens` will be non-zero, even for an empty string response
        #   #     from Claude.
        #   def initialize(data = {}) = super
      end
    end

    BetaMessage = Beta::BetaMessage
  end
end
