# typed: strong

module Anthropic
  module Resources
    class Messages
      sig { returns(Anthropic::Resources::Messages::Batches) }
      def batches
      end

      # Send a structured list of input messages with text and/or image content, and the
      #   model will generate the next message in the conversation.
      #
      #   The Messages API can be used for either single queries or stateless multi-turn
      #   conversations.
      #
      #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          temperature: Float,
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          stream: T.noreturn,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Models::Message)
      end
      def create(
        # The maximum number of tokens to generate before stopping.
        #
        #   Note that our models may stop _before_ reaching this maximum. This parameter
        #   only specifies the absolute maximum number of tokens to generate.
        #
        #   Different models have different maximum values for this parameter. See
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for details.
        max_tokens:,
        # Input messages.
        #
        #   Our models are trained to operate on alternating `user` and `assistant`
        #   conversational turns. When creating a new `Message`, you specify the prior
        #   conversational turns with the `messages` parameter, and the model then generates
        #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        #   in your request will be combined into a single turn.
        #
        #   Each input message must be an object with a `role` and `content`. You can
        #   specify a single `user`-role message, or you can include multiple `user` and
        #   `assistant` messages.
        #
        #   If the final message uses the `assistant` role, the response content will
        #   continue immediately from the content in that message. This can be used to
        #   constrain part of the model's response.
        #
        #   Example with a single `user` message:
        #
        #   ```json
        #   [{ "role": "user", "content": "Hello, Claude" }]
        #   ```
        #
        #   Example with multiple conversational turns:
        #
        #   ```json
        #   [
        #     { "role": "user", "content": "Hello there." },
        #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
        #   ]
        #   ```
        #
        #   Example with a partially-filled response from Claude:
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
        #   Each input message `content` may be either a single `string` or an array of
        #   content blocks, where each block has a specific `type`. Using a `string` for
        #   `content` is shorthand for an array of one content block of type `"text"`. The
        #   following input messages are equivalent:
        #
        #   ```json
        #   { "role": "user", "content": "Hello, Claude" }
        #   ```
        #
        #   ```json
        #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        #   ```
        #
        #   Starting with Claude 3 models, you can also send image content blocks:
        #
        #   ```json
        #   {
        #     "role": "user",
        #     "content": [
        #       {
        #         "type": "image",
        #         "source": {
        #           "type": "base64",
        #           "media_type": "image/jpeg",
        #           "data": "/9j/4AAQSkZJRg..."
        #         }
        #       },
        #       { "type": "text", "text": "What is in this image?" }
        #     ]
        #   }
        #   ```
        #
        #   We currently support the `base64` source type for images, and the `image/jpeg`,
        #   `image/png`, `image/gif`, and `image/webp` media types.
        #
        #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
        #   more input examples.
        #
        #   Note that if you want to include a
        #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
        #   the top-level `system` parameter — there is no `"system"` role for input
        #   messages in the Messages API.
        messages:,
        # The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        model:,
        # An object describing metadata about the request.
        metadata: nil,
        # Custom text sequences that will cause the model to stop generating.
        #
        #   Our models will normally stop when they have naturally completed their turn,
        #   which will result in a response `stop_reason` of `"end_turn"`.
        #
        #   If you want the model to stop generating when it encounters custom strings of
        #   text, you can use the `stop_sequences` parameter. If the model encounters one of
        #   the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
        #   and the response `stop_sequence` value will contain the matched stop sequence.
        stop_sequences: nil,
        # System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        system_: nil,
        # Amount of randomness injected into the response.
        #
        #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
        #   for analytical / multiple choice, and closer to `1.0` for creative and
        #   generative tasks.
        #
        #   Note that even with `temperature` of `0.0`, the results will not be fully
        #   deterministic.
        temperature: nil,
        # Configuration for enabling Claude's extended thinking.
        #
        #   When enabled, responses include `thinking` content blocks showing Claude's
        #   thinking process before the final answer. Requires a minimum budget of 1,024
        #   tokens and counts towards your `max_tokens` limit.
        #
        #   See
        #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        thinking: nil,
        # How the model should use the provided tools. The model can use a specific tool,
        #   any available tool, decide by itself, or not use tools at all.
        tool_choice: nil,
        # Definitions of tools that the model may use.
        #
        #   If you include `tools` in your API request, the model may return `tool_use`
        #   content blocks that represent the model's use of those tools. You can then run
        #   those tools using the tool input generated by the model and then optionally
        #   return results back to the model using `tool_result` content blocks.
        #
        #   Each tool definition includes:
        #
        #   - `name`: Name of the tool.
        #   - `description`: Optional, but strongly-recommended description of the tool.
        #   - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
        #     tool `input` shape that the model will produce in `tool_use` output content
        #     blocks.
        #
        #   For example, if you defined `tools` as:
        #
        #   ```json
        #   [
        #     {
        #       "name": "get_stock_price",
        #       "description": "Get the current stock price for a given ticker symbol.",
        #       "input_schema": {
        #         "type": "object",
        #         "properties": {
        #           "ticker": {
        #             "type": "string",
        #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #           }
        #         },
        #         "required": ["ticker"]
        #       }
        #     }
        #   ]
        #   ```
        #
        #   And then asked the model "What's the S&P 500 at today?", the model might produce
        #   `tool_use` content blocks in the response like this:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_use",
        #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "name": "get_stock_price",
        #       "input": { "ticker": "^GSPC" }
        #     }
        #   ]
        #   ```
        #
        #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        #   input, and return the following back to the model in a subsequent `user`
        #   message:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_result",
        #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "content": "259.75 USD"
        #     }
        #   ]
        #   ```
        #
        #   Tools can be used for workflows that include running client-side tools and
        #   functions, or more generally whenever you want the model to produce a particular
        #   JSON structure of output.
        #
        #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        tools: nil,
        # Only sample from the top K options for each subsequent token.
        #
        #   Used to remove "long tail" low probability responses.
        #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        top_k: nil,
        # Use nucleus sampling.
        #
        #   In nucleus sampling, we compute the cumulative distribution over all the options
        #   for each subsequent token in decreasing probability order and cut it off once it
        #   reaches a particular probability specified by `top_p`. You should either alter
        #   `temperature` or `top_p`, but not both.
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        top_p: nil,
        # There is no need to provide `stream:`. Instead, use `#create_streaming` or
        #   `#create` for streaming and non-streaming use cases, respectively.
        stream: false,
        request_options: {}
      )
      end

      # Send a structured list of input messages with text and/or image content, and the
      #   model will generate the next message in the conversation.
      #
      #   The Messages API can be used for either single queries or stateless multi-turn
      #   conversations.
      #
      #   Learn more about the Messages API in our [user guide](/en/docs/initial-setup)
      sig do
        params(
          max_tokens: Integer,
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          temperature: Float,
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          top_k: Integer,
          top_p: Float,
          stream: T.noreturn,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(
            Anthropic::Stream[
            T.any(
              Anthropic::Models::RawMessageStartEvent,
              Anthropic::Models::RawMessageDeltaEvent,
              Anthropic::Models::RawMessageStopEvent,
              Anthropic::Models::RawContentBlockStartEvent,
              Anthropic::Models::RawContentBlockDeltaEvent,
              Anthropic::Models::RawContentBlockStopEvent
            )
            ]
          )
      end
      def create_streaming(
        # The maximum number of tokens to generate before stopping.
        #
        #   Note that our models may stop _before_ reaching this maximum. This parameter
        #   only specifies the absolute maximum number of tokens to generate.
        #
        #   Different models have different maximum values for this parameter. See
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for details.
        max_tokens:,
        # Input messages.
        #
        #   Our models are trained to operate on alternating `user` and `assistant`
        #   conversational turns. When creating a new `Message`, you specify the prior
        #   conversational turns with the `messages` parameter, and the model then generates
        #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        #   in your request will be combined into a single turn.
        #
        #   Each input message must be an object with a `role` and `content`. You can
        #   specify a single `user`-role message, or you can include multiple `user` and
        #   `assistant` messages.
        #
        #   If the final message uses the `assistant` role, the response content will
        #   continue immediately from the content in that message. This can be used to
        #   constrain part of the model's response.
        #
        #   Example with a single `user` message:
        #
        #   ```json
        #   [{ "role": "user", "content": "Hello, Claude" }]
        #   ```
        #
        #   Example with multiple conversational turns:
        #
        #   ```json
        #   [
        #     { "role": "user", "content": "Hello there." },
        #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
        #   ]
        #   ```
        #
        #   Example with a partially-filled response from Claude:
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
        #   Each input message `content` may be either a single `string` or an array of
        #   content blocks, where each block has a specific `type`. Using a `string` for
        #   `content` is shorthand for an array of one content block of type `"text"`. The
        #   following input messages are equivalent:
        #
        #   ```json
        #   { "role": "user", "content": "Hello, Claude" }
        #   ```
        #
        #   ```json
        #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        #   ```
        #
        #   Starting with Claude 3 models, you can also send image content blocks:
        #
        #   ```json
        #   {
        #     "role": "user",
        #     "content": [
        #       {
        #         "type": "image",
        #         "source": {
        #           "type": "base64",
        #           "media_type": "image/jpeg",
        #           "data": "/9j/4AAQSkZJRg..."
        #         }
        #       },
        #       { "type": "text", "text": "What is in this image?" }
        #     ]
        #   }
        #   ```
        #
        #   We currently support the `base64` source type for images, and the `image/jpeg`,
        #   `image/png`, `image/gif`, and `image/webp` media types.
        #
        #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
        #   more input examples.
        #
        #   Note that if you want to include a
        #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
        #   the top-level `system` parameter — there is no `"system"` role for input
        #   messages in the Messages API.
        messages:,
        # The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        model:,
        # An object describing metadata about the request.
        metadata: nil,
        # Custom text sequences that will cause the model to stop generating.
        #
        #   Our models will normally stop when they have naturally completed their turn,
        #   which will result in a response `stop_reason` of `"end_turn"`.
        #
        #   If you want the model to stop generating when it encounters custom strings of
        #   text, you can use the `stop_sequences` parameter. If the model encounters one of
        #   the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
        #   and the response `stop_sequence` value will contain the matched stop sequence.
        stop_sequences: nil,
        # System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        system_: nil,
        # Amount of randomness injected into the response.
        #
        #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
        #   for analytical / multiple choice, and closer to `1.0` for creative and
        #   generative tasks.
        #
        #   Note that even with `temperature` of `0.0`, the results will not be fully
        #   deterministic.
        temperature: nil,
        # Configuration for enabling Claude's extended thinking.
        #
        #   When enabled, responses include `thinking` content blocks showing Claude's
        #   thinking process before the final answer. Requires a minimum budget of 1,024
        #   tokens and counts towards your `max_tokens` limit.
        #
        #   See
        #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        thinking: nil,
        # How the model should use the provided tools. The model can use a specific tool,
        #   any available tool, decide by itself, or not use tools at all.
        tool_choice: nil,
        # Definitions of tools that the model may use.
        #
        #   If you include `tools` in your API request, the model may return `tool_use`
        #   content blocks that represent the model's use of those tools. You can then run
        #   those tools using the tool input generated by the model and then optionally
        #   return results back to the model using `tool_result` content blocks.
        #
        #   Each tool definition includes:
        #
        #   - `name`: Name of the tool.
        #   - `description`: Optional, but strongly-recommended description of the tool.
        #   - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
        #     tool `input` shape that the model will produce in `tool_use` output content
        #     blocks.
        #
        #   For example, if you defined `tools` as:
        #
        #   ```json
        #   [
        #     {
        #       "name": "get_stock_price",
        #       "description": "Get the current stock price for a given ticker symbol.",
        #       "input_schema": {
        #         "type": "object",
        #         "properties": {
        #           "ticker": {
        #             "type": "string",
        #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #           }
        #         },
        #         "required": ["ticker"]
        #       }
        #     }
        #   ]
        #   ```
        #
        #   And then asked the model "What's the S&P 500 at today?", the model might produce
        #   `tool_use` content blocks in the response like this:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_use",
        #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "name": "get_stock_price",
        #       "input": { "ticker": "^GSPC" }
        #     }
        #   ]
        #   ```
        #
        #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        #   input, and return the following back to the model in a subsequent `user`
        #   message:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_result",
        #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "content": "259.75 USD"
        #     }
        #   ]
        #   ```
        #
        #   Tools can be used for workflows that include running client-side tools and
        #   functions, or more generally whenever you want the model to produce a particular
        #   JSON structure of output.
        #
        #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        tools: nil,
        # Only sample from the top K options for each subsequent token.
        #
        #   Used to remove "long tail" low probability responses.
        #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        top_k: nil,
        # Use nucleus sampling.
        #
        #   In nucleus sampling, we compute the cumulative distribution over all the options
        #   for each subsequent token in decreasing probability order and cut it off once it
        #   reaches a particular probability specified by `top_p`. You should either alter
        #   `temperature` or `top_p`, but not both.
        #
        #   Recommended for advanced use cases only. You usually only need to use
        #   `temperature`.
        top_p: nil,
        # There is no need to provide `stream:`. Instead, use `#create_streaming` or
        #   `#create` for streaming and non-streaming use cases, respectively.
        stream: true,
        request_options: {}
      )
      end

      # Count the number of tokens in a Message.
      #
      #   The Token Count API can be used to count the number of tokens in a Message,
      #   including tools, images, and documents, without creating it.
      #
      #   Learn more about token counting in our
      #   [user guide](/en/docs/build-with-claude/token-counting)
      sig do
        params(
          messages: T::Array[Anthropic::Models::MessageParam],
          model: T.any(Symbol, String),
          system_: T.any(String, T::Array[Anthropic::Models::TextBlockParam]),
          thinking: T.any(Anthropic::Models::ThinkingConfigEnabled, Anthropic::Models::ThinkingConfigDisabled),
          tool_choice: T.any(
            Anthropic::Models::ToolChoiceAuto,
            Anthropic::Models::ToolChoiceAny,
            Anthropic::Models::ToolChoiceTool,
            Anthropic::Models::ToolChoiceNone
          ),
          tools: T::Array[
          T.any(
            Anthropic::Models::Tool,
            Anthropic::Models::ToolBash20250124,
            Anthropic::Models::ToolTextEditor20250124
          )
          ],
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Models::MessageTokensCount)
      end
      def count_tokens(
        # Input messages.
        #
        #   Our models are trained to operate on alternating `user` and `assistant`
        #   conversational turns. When creating a new `Message`, you specify the prior
        #   conversational turns with the `messages` parameter, and the model then generates
        #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
        #   in your request will be combined into a single turn.
        #
        #   Each input message must be an object with a `role` and `content`. You can
        #   specify a single `user`-role message, or you can include multiple `user` and
        #   `assistant` messages.
        #
        #   If the final message uses the `assistant` role, the response content will
        #   continue immediately from the content in that message. This can be used to
        #   constrain part of the model's response.
        #
        #   Example with a single `user` message:
        #
        #   ```json
        #   [{ "role": "user", "content": "Hello, Claude" }]
        #   ```
        #
        #   Example with multiple conversational turns:
        #
        #   ```json
        #   [
        #     { "role": "user", "content": "Hello there." },
        #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
        #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
        #   ]
        #   ```
        #
        #   Example with a partially-filled response from Claude:
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
        #   Each input message `content` may be either a single `string` or an array of
        #   content blocks, where each block has a specific `type`. Using a `string` for
        #   `content` is shorthand for an array of one content block of type `"text"`. The
        #   following input messages are equivalent:
        #
        #   ```json
        #   { "role": "user", "content": "Hello, Claude" }
        #   ```
        #
        #   ```json
        #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
        #   ```
        #
        #   Starting with Claude 3 models, you can also send image content blocks:
        #
        #   ```json
        #   {
        #     "role": "user",
        #     "content": [
        #       {
        #         "type": "image",
        #         "source": {
        #           "type": "base64",
        #           "media_type": "image/jpeg",
        #           "data": "/9j/4AAQSkZJRg..."
        #         }
        #       },
        #       { "type": "text", "text": "What is in this image?" }
        #     ]
        #   }
        #   ```
        #
        #   We currently support the `base64` source type for images, and the `image/jpeg`,
        #   `image/png`, `image/gif`, and `image/webp` media types.
        #
        #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
        #   more input examples.
        #
        #   Note that if you want to include a
        #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
        #   the top-level `system` parameter — there is no `"system"` role for input
        #   messages in the Messages API.
        messages:,
        # The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        model:,
        # System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        system_: nil,
        # Configuration for enabling Claude's extended thinking.
        #
        #   When enabled, responses include `thinking` content blocks showing Claude's
        #   thinking process before the final answer. Requires a minimum budget of 1,024
        #   tokens and counts towards your `max_tokens` limit.
        #
        #   See
        #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        thinking: nil,
        # How the model should use the provided tools. The model can use a specific tool,
        #   any available tool, decide by itself, or not use tools at all.
        tool_choice: nil,
        # Definitions of tools that the model may use.
        #
        #   If you include `tools` in your API request, the model may return `tool_use`
        #   content blocks that represent the model's use of those tools. You can then run
        #   those tools using the tool input generated by the model and then optionally
        #   return results back to the model using `tool_result` content blocks.
        #
        #   Each tool definition includes:
        #
        #   - `name`: Name of the tool.
        #   - `description`: Optional, but strongly-recommended description of the tool.
        #   - `input_schema`: [JSON schema](https://json-schema.org/draft/2020-12) for the
        #     tool `input` shape that the model will produce in `tool_use` output content
        #     blocks.
        #
        #   For example, if you defined `tools` as:
        #
        #   ```json
        #   [
        #     {
        #       "name": "get_stock_price",
        #       "description": "Get the current stock price for a given ticker symbol.",
        #       "input_schema": {
        #         "type": "object",
        #         "properties": {
        #           "ticker": {
        #             "type": "string",
        #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
        #           }
        #         },
        #         "required": ["ticker"]
        #       }
        #     }
        #   ]
        #   ```
        #
        #   And then asked the model "What's the S&P 500 at today?", the model might produce
        #   `tool_use` content blocks in the response like this:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_use",
        #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "name": "get_stock_price",
        #       "input": { "ticker": "^GSPC" }
        #     }
        #   ]
        #   ```
        #
        #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
        #   input, and return the following back to the model in a subsequent `user`
        #   message:
        #
        #   ```json
        #   [
        #     {
        #       "type": "tool_result",
        #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
        #       "content": "259.75 USD"
        #     }
        #   ]
        #   ```
        #
        #   Tools can be used for workflows that include running client-side tools and
        #   functions, or more generally whenever you want the model to produce a particular
        #   JSON structure of output.
        #
        #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
        tools: nil,
        request_options: {}
      )
      end

      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
