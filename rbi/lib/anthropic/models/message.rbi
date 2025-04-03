# typed: strong

module Anthropic
  module Models
    class Message < Anthropic::Internal::Type::BaseModel
      # Unique object identifier.
      #
      #   The format and length of IDs may change over time.
      sig { returns(String) }
      attr_accessor :id

      # Content generated by the model.
      #
      #   This is an array of content blocks, each of which has a `type` that determines
      #   its shape.
      #
      #   Example:
      #
      #   ```json
      #   [{ "type": "text", "text": "Hi, I'm Claude." }]
      #   ```
      #
      #   If the request input `messages` ended with an `assistant` turn, then the
      #   response `content` will continue directly from that last turn. You can use this
      #   to constrain the model's output.
      #
      #   For example, if the input `messages` were:
      #
      #   ```json
      #   [
      #     {
      #       "role": "user",
      #       "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"
      #     },
      #     { "role": "assistant", "content": "The best answer is (" }
      #   ]
      #   ```
      #
      #   Then the response `content` might be:
      #
      #   ```json
      #   [{ "type": "text", "text": "B)" }]
      #   ```
      sig do
        returns(
          T::Array[
          T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
          ]
        )
      end
      attr_accessor :content

      # The model that will complete your prompt.\n\nSee
      #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(T.any(Anthropic::Models::Model::TaggedSymbol, String)) }
      attr_accessor :model

      # Conversational role of the generated message.
      #
      #   This will always be `"assistant"`.
      sig { returns(Symbol) }
      attr_accessor :role

      # The reason that we stopped.
      #
      #   This may be one the following values:
      #
      #   - `"end_turn"`: the model reached a natural stopping point
      #   - `"max_tokens"`: we exceeded the requested `max_tokens` or the model's maximum
      #   - `"stop_sequence"`: one of your provided custom `stop_sequences` was generated
      #   - `"tool_use"`: the model invoked one or more tools
      #
      #   In non-streaming mode this value is always non-null. In streaming mode, it is
      #   null in the `message_start` event and non-null otherwise.
      sig { returns(T.nilable(Anthropic::Models::StopReason::TaggedSymbol)) }
      attr_accessor :stop_reason

      # Which custom stop sequence was generated, if any.
      #
      #   This value will be a non-null string if one of your custom stop sequences was
      #   generated.
      sig { returns(T.nilable(String)) }
      attr_accessor :stop_sequence

      # Object type.
      #
      #   For Messages, this is always `"message"`.
      sig { returns(Symbol) }
      attr_accessor :type

      # Billing and rate-limit usage.
      #
      #   Anthropic's API bills and rate-limits by token counts, as tokens represent the
      #   underlying cost to our systems.
      #
      #   Under the hood, the API transforms requests into a format suitable for the
      #   model. The model's output then goes through a parsing stage before becoming an
      #   API response. As a result, the token counts in `usage` will not match one-to-one
      #   with the exact visible content of an API request or response.
      #
      #   For example, `output_tokens` will be non-zero, even for an empty string response
      #   from Claude.
      #
      #   Total input tokens in a request is the summation of `input_tokens`,
      #   `cache_creation_input_tokens`, and `cache_read_input_tokens`.
      sig { returns(Anthropic::Models::Usage) }
      attr_reader :usage

      sig { params(usage: T.any(Anthropic::Models::Usage, Anthropic::Internal::AnyHash)).void }
      attr_writer :usage

      sig do
        params(
          id: String,
          content: T::Array[
          T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Internal::AnyHash,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
          ],
          model: T.any(Anthropic::Models::Model::OrSymbol, String),
          stop_reason: T.nilable(Anthropic::Models::StopReason::OrSymbol),
          stop_sequence: T.nilable(String),
          usage: T.any(Anthropic::Models::Usage, Anthropic::Internal::AnyHash),
          role: Symbol,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(
        id:,
        content:,
        model:,
        stop_reason:,
        stop_sequence:,
        usage:,
        role: :assistant,
        type: :message
      )
      end

      sig do
        override
          .returns(
            {
              id: String,
              content: T::Array[
              T.any(
                Anthropic::Models::TextBlock,
                Anthropic::Models::ToolUseBlock,
                Anthropic::Models::ThinkingBlock,
                Anthropic::Models::RedactedThinkingBlock
              )
              ],
              model: T.any(Anthropic::Models::Model::TaggedSymbol, String),
              role: Symbol,
              stop_reason: T.nilable(Anthropic::Models::StopReason::TaggedSymbol),
              stop_sequence: T.nilable(String),
              type: Symbol,
              usage: Anthropic::Models::Usage
            }
          )
      end
      def to_hash
      end
    end
  end
end
