# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # beta_message => {
      #   id: String,
      #   content: -> { Anthropic::ArrayOf[Anthropic::Models::Beta::BetaContentBlock] === _1 },
      #   model: Anthropic::Models::Model,
      #   role: Anthropic::Models::Beta::BetaMessage::Role,
      #   stop_reason: Anthropic::Models::Beta::BetaMessage::StopReason,
      #   **_
      # }
      # ```
      class BetaMessage < Anthropic::BaseModel
        # @!attribute id
        #   Unique object identifier.
        #
        # The format and length of IDs may change over time.
        #
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
        #
        #   @return [Array<Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock>]
        required :content, -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaContentBlock] }

        # @!attribute model
        #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
        #
        #   @return [String, Symbol, Anthropic::Models::Model::UnionMember1]
        required :model, union: -> { Anthropic::Models::Model }

        # @!attribute role
        #   Conversational role of the generated message.
        #
        # This will always be `"assistant"`.
        #
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
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaMessage::StopReason, nil]
        required :stop_reason, enum: -> { Anthropic::Models::Beta::BetaMessage::StopReason }

        # @!attribute stop_sequence
        #   Which custom stop sequence was generated, if any.
        #
        # This value will be a non-null string if one of your custom stop sequences was generated.
        #
        #   @return [String, nil]
        required :stop_sequence, String

        # @!attribute type
        #   Object type.
        #
        # For Messages, this is always `"message"`.
        #
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
        #
        #   @return [Anthropic::Models::Beta::BetaUsage]
        required :usage, -> { Anthropic::Models::Beta::BetaUsage }

        # @!parse
        #   # @param id [String] Unique object identifier.
        #   #
        #   #   The format and length of IDs may change over time.
        #   #
        #   # @param content [Array<Anthropic::Models::Beta::BetaTextBlock, Anthropic::Models::Beta::BetaToolUseBlock>] Content generated by the model.
        #   #
        #   #   This is an array of content blocks, each of which has a `type` that determines
        #   #   its shape.
        #   #
        #   #   Example:
        #   #
        #   #   ```json
        #   #   [{ "type": "text", "text": "Hi, I'm Claude." }]
        #   #   ```
        #   #
        #   #   If the request input `messages` ended with an `assistant` turn, then the
        #   #   response `content` will continue directly from that last turn. You can use this
        #   #   to constrain the model's output.
        #   #
        #   #   For example, if the input `messages` were:
        #   #
        #   #   ```json
        #   #   [
        #   #     {
        #   #       "role": "user",
        #   #       "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
        #   #     },
        #   #     { "role": "assistant", "content": "The best answer is (" }
        #   #   ]
        #   #   ```
        #   #
        #   #   Then the response `content` might be:
        #   #
        #   #   ```json
        #   #   [{ "type": "text", "text": "B)" }]
        #   #   ```
        #   #
        #   # @param model [String] The model that will complete your prompt.\n\nSee
        #   #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   #   details and options.
        #   #
        #   # @param role [String] Conversational role of the generated message.
        #   #
        #   #   This will always be `"assistant"`.
        #   #
        #   # @param stop_reason [String, nil] The reason that we stopped.
        #   #
        #   #   This may be one the following values:
        #   #
        #   #   - `"end_turn"`: the model reached a natural stopping point
        #   #   - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
        #   #   - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
        #   #   - `"tool_use"`: the model invoked one or more tools
        #   #
        #   #   In non-streaming mode this value is always non-null. In streaming mode, it is
        #   #   null in the `message_start` event and non-null otherwise.
        #   #
        #   # @param stop_sequence [String, nil] Which custom stop sequence was generated, if any.
        #   #
        #   #   This value will be a non-null string if one of your custom stop sequences was
        #   #   generated.
        #   #
        #   # @param type [String] Object type.
        #   #
        #   #   For Messages, this is always `"message"`.
        #   #
        #   # @param usage [Anthropic::Models::Beta::BetaUsage] Billing and rate-limit usage.
        #   #
        #   #   Anthropic's API bills and rate-limits by token counts, as tokens represent the
        #   #   underlying cost to our systems.
        #   #
        #   #   Under the hood, the API transforms requests into a format suitable for the
        #   #   model. The model's output then goes through a parsing stage before becoming an
        #   #   API response. As a result, the token counts in `usage` will not match one-to-one
        #   #   with the exact visible content of an API request or response.
        #   #
        #   #   For example, `output_tokens` will be non-zero, even for an empty string response
        #   #   from Claude.
        #   #
        #   def initialize(id:, content:, model:, role:, stop_reason:, stop_sequence:, type:, usage:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # Conversational role of the generated message.
        #
        # This will always be `"assistant"`.
        #
        # @example
        #
        # ```ruby
        # case role
        # in :assistant
        #   # ...
        # end
        # ```
        class Role < Anthropic::Enum
          ASSISTANT = :assistant

          finalize!
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
        #
        # @example
        #
        # ```ruby
        # case stop_reason
        # in :end_turn
        #   # ...
        # in :max_tokens
        #   # ...
        # in :stop_sequence
        #   # ...
        # in :tool_use
        #   # ...
        # end
        # ```
        class StopReason < Anthropic::Enum
          END_TURN = :end_turn
          MAX_TOKENS = :max_tokens
          STOP_SEQUENCE = :stop_sequence
          TOOL_USE = :tool_use

          finalize!
        end

        # Object type.
        #
        # For Messages, this is always `"message"`.
        #
        # @example
        #
        # ```ruby
        # case type
        # in :message
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          MESSAGE = :message

          finalize!
        end
      end
    end

    BetaMessage = Beta::BetaMessage
  end
end
