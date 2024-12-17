# frozen_string_literal: true

module Anthropic
  module Models
    class Message < Anthropic::BaseModel
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
      #   @return [Array<Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock>]
      required :content, Anthropic::ArrayOf[Anthropic::Unknown]

      # @!attribute model
      #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
      #
      #   @return [String, Symbol, Anthropic::Models::Model::UnnamedTypeWithunionParent15]
      required :model, Anthropic::Unknown

      # @!attribute role
      #   Conversational role of the generated message.
      #
      # This will always be `"assistant"`.
      #
      #   @return [Symbol, Anthropic::Models::Message::Role]
      required :role, enum: -> { Anthropic::Models::Message::Role }

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
      #   @return [Symbol, Anthropic::Models::Message::StopReason]
      required :stop_reason, enum: -> { Anthropic::Models::Message::StopReason }

      # @!attribute stop_sequence
      #   Which custom stop sequence was generated, if any.
      #
      # This value will be a non-null string if one of your custom stop sequences was generated.
      #
      #   @return [String]
      required :stop_sequence, String

      # @!attribute type
      #   Object type.
      #
      # For Messages, this is always `"message"`.
      #
      #   @return [Symbol, Anthropic::Models::Message::Type]
      required :type, enum: -> { Anthropic::Models::Message::Type }

      # @!attribute usage
      #   Billing and rate-limit usage.
      #
      # Anthropic's API bills and rate-limits by token counts, as tokens represent the underlying cost to our systems.
      #
      # Under the hood, the API transforms requests into a format suitable for the model. The model's output then goes through a parsing stage before becoming an API response. As a result, the token counts in `usage` will not match one-to-one with the exact visible content of an API request or response.
      #
      # For example, `output_tokens` will be non-zero, even for an empty string response from Claude.
      #
      #   @return [Anthropic::Models::Usage]
      required :usage, -> { Anthropic::Models::Usage }

      # @!parse
      #   # @param id [String] Unique object identifier.
      #   #
      #   #   The format and length of IDs may change over time.
      #   #
      #   # @param content [Array<Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock>] Content generated by the model.
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
      #   # @param stop_reason [String] The reason that we stopped.
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
      #   # @param stop_sequence [String] Which custom stop sequence was generated, if any.
      #   #
      #   #   This value will be a non-null string if one of your custom stop sequences was
      #   #   generated.
      #   #
      #   # @param type [String] Object type.
      #   #
      #   #   For Messages, this is always `"message"`.
      #   #
      #   # @param usage [Anthropic::Models::Usage] Billing and rate-limit usage.
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
      #   def initialize(id:, content:, model:, role:, stop_reason:, stop_sequence:, type:, usage:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # Conversational role of the generated message.
      #
      # This will always be `"assistant"`.
      #
      # @example
      #
      # ```ruby
      # case enum
      # in :assistant
      #   # ...
      # end
      # ```
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
      #
      # @example
      #
      # ```ruby
      # case enum
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
      end

      # Object type.
      #
      # For Messages, this is always `"message"`.
      #
      # @example
      #
      # ```ruby
      # case enum
      # in :message
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        MESSAGE = :message
      end
    end
  end
end
