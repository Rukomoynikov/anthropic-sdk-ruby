# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Messages#create
    #
    # @see Anthropic::Resources::Messages#stream_raw
    class Message < Anthropic::BaseModel
      # @!attribute id
      #   Unique object identifier.
      #
      #     The format and length of IDs may change over time.
      #
      #   @return [String]
      required :id, String

      # @!attribute content
      #   Content generated by the model.
      #
      #     This is an array of content blocks, each of which has a `type` that determines
      #     its shape.
      #
      #     Example:
      #
      #     ```json
      #     [{ "type": "text", "text": "Hi, I'm Claude." }]
      #     ```
      #
      #     If the request input `messages` ended with an `assistant` turn, then the
      #     response `content` will continue directly from that last turn. You can use this
      #     to constrain the model's output.
      #
      #     For example, if the input `messages` were:
      #
      #     ```json
      #     [
      #       {
      #         "role": "user",
      #         "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
      #       },
      #       { "role": "assistant", "content": "The best answer is (" }
      #     ]
      #     ```
      #
      #     Then the response `content` might be:
      #
      #     ```json
      #     [{ "type": "text", "text": "B)" }]
      #     ```
      #
      #   @return [Array<Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock>]
      required :content, -> { Anthropic::ArrayOf[union: Anthropic::Models::ContentBlock] }

      # @!attribute model
      #   The model that will complete your prompt.\n\nSee
      #     [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #     details and options.
      #
      #   @return [Symbol, String, Anthropic::Models::Model]
      required :model, union: -> { Anthropic::Models::Model }

      # @!attribute role
      #   Conversational role of the generated message.
      #
      #     This will always be `"assistant"`.
      #
      #   @return [Symbol, :assistant]
      required :role, const: :assistant

      # @!attribute stop_reason
      #   The reason that we stopped.
      #
      #     This may be one the following values:
      #
      #     - `"end_turn"`: the model reached a natural stopping point
      #     - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
      #     - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
      #     - `"tool_use"`: the model invoked one or more tools
      #
      #     In non-streaming mode this value is always non-null. In streaming mode, it is
      #     null in the `message_start` event and non-null otherwise.
      #
      #   @return [Symbol, Anthropic::Models::StopReason, nil]
      required :stop_reason, enum: -> { Anthropic::Models::StopReason }, nil?: true

      # @!attribute stop_sequence
      #   Which custom stop sequence was generated, if any.
      #
      #     This value will be a non-null string if one of your custom stop sequences was
      #     generated.
      #
      #   @return [String, nil]
      required :stop_sequence, String, nil?: true

      # @!attribute type
      #   Object type.
      #
      #     For Messages, this is always `"message"`.
      #
      #   @return [Symbol, :message]
      required :type, const: :message

      # @!attribute usage
      #   Billing and rate-limit usage.
      #
      #     Anthropic's API bills and rate-limits by token counts, as tokens represent the
      #     underlying cost to our systems.
      #
      #     Under the hood, the API transforms requests into a format suitable for the
      #     model. The model's output then goes through a parsing stage before becoming an
      #     API response. As a result, the token counts in `usage` will not match one-to-one
      #     with the exact visible content of an API request or response.
      #
      #     For example, `output_tokens` will be non-zero, even for an empty string response
      #     from Claude.
      #
      #     Total input tokens in a request is the summation of `input_tokens`,
      #     `cache_creation_input_tokens`, and `cache_read_input_tokens`.
      #
      #   @return [Anthropic::Models::Usage]
      required :usage, -> { Anthropic::Models::Usage }

      # @!parse
      #   # @param id [String]
      #   # @param content [Array<Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock, Anthropic::Models::ThinkingBlock, Anthropic::Models::RedactedThinkingBlock>]
      #   # @param model [Symbol, String, Anthropic::Models::Model]
      #   # @param stop_reason [Symbol, Anthropic::Models::StopReason, nil]
      #   # @param stop_sequence [String, nil]
      #   # @param usage [Anthropic::Models::Usage]
      #   # @param role [Symbol, :assistant]
      #   # @param type [Symbol, :message]
      #   #
      #   def initialize(id:, content:, model:, stop_reason:, stop_sequence:, usage:, role: :assistant, type: :message, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
