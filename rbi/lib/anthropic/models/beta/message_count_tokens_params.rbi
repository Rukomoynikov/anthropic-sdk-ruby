# typed: strong

module Anthropic
  module Models
    module Beta
      class MessageCountTokensParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

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
        sig { returns(T::Array[Anthropic::Models::Beta::BetaMessageParam]) }
        def messages
        end

        sig do
          params(_: T::Array[Anthropic::Models::Beta::BetaMessageParam])
            .returns(T::Array[Anthropic::Models::Beta::BetaMessageParam])
        end
        def messages=(_)
        end

        # The model that will complete your prompt.\n\nSee
        #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        #   details and options.
        sig { returns(T.any(Anthropic::Models::Model::OrSymbol, String)) }
        def model
        end

        sig do
          params(_: T.any(Anthropic::Models::Model::OrSymbol, String))
            .returns(T.any(Anthropic::Models::Model::OrSymbol, String))
        end
        def model=(_)
        end

        # System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        sig { returns(T.nilable(T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))) }
        def system_
        end

        sig do
          params(_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))
            .returns(T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]))
        end
        def system_=(_)
        end

        # Configuration for enabling Claude's extended thinking.
        #
        #   When enabled, responses include `thinking` content blocks showing Claude's
        #   thinking process before the final answer. Requires a minimum budget of 1,024
        #   tokens and counts towards your `max_tokens` limit.
        #
        #   See
        #   [extended thinking](https://docs.anthropic.com/en/docs/build-with-claude/extended-thinking)
        #   for details.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Models::Beta::BetaThinkingConfigEnabled,
                Anthropic::Models::Beta::BetaThinkingConfigDisabled
              )
            )
          )
        end
        def thinking
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaThinkingConfigEnabled,
                Anthropic::Models::Beta::BetaThinkingConfigDisabled
              )
            )
        end
        def thinking=(_)
        end

        # How the model should use the provided tools. The model can use a specific tool,
        #   any available tool, decide by itself, or not use tools at all.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool,
                Anthropic::Models::Beta::BetaToolChoiceNone
              )
            )
          )
        end
        def tool_choice
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaToolChoiceAuto,
                Anthropic::Models::Beta::BetaToolChoiceAny,
                Anthropic::Models::Beta::BetaToolChoiceTool,
                Anthropic::Models::Beta::BetaToolChoiceNone
              )
            )
        end
        def tool_choice=(_)
        end

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
        sig do
          returns(
            T.nilable(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022,
                Anthropic::Models::Beta::BetaToolComputerUse20250124,
                Anthropic::Models::Beta::BetaToolBash20250124,
                Anthropic::Models::Beta::BetaToolTextEditor20250124
              )
              ]
            )
          )
        end
        def tools
        end

        sig do
          params(
            _: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ]
          )
            .returns(
              T::Array[
              T.any(
                Anthropic::Models::Beta::BetaTool,
                Anthropic::Models::Beta::BetaToolComputerUse20241022,
                Anthropic::Models::Beta::BetaToolBash20241022,
                Anthropic::Models::Beta::BetaToolTextEditor20241022,
                Anthropic::Models::Beta::BetaToolComputerUse20250124,
                Anthropic::Models::Beta::BetaToolBash20250124,
                Anthropic::Models::Beta::BetaToolTextEditor20250124
              )
              ]
            )
        end
        def tools=(_)
        end

        # Optional header to specify the beta version(s) you want to use.
        sig { returns(T.nilable(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])) }
        def betas
        end

        sig do
          params(_: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])
            .returns(T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)])
        end
        def betas=(_)
        end

        sig do
          params(
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Anthropic::Models::Model::OrSymbol, String),
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool,
              Anthropic::Models::Beta::BetaToolChoiceNone
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaTool,
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124
            )
            ],
            betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
            request_options: T.any(Anthropic::RequestOptions, Anthropic::Util::AnyHash)
          )
            .returns(T.attached_class)
        end
        def self.new(
          messages:,
          model:,
          system_: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig do
          override
            .returns(
              {
                messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
                model: T.any(Anthropic::Models::Model::OrSymbol, String),
                system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
                thinking: T.any(
                  Anthropic::Models::Beta::BetaThinkingConfigEnabled,
                  Anthropic::Models::Beta::BetaThinkingConfigDisabled
                ),
                tool_choice: T.any(
                  Anthropic::Models::Beta::BetaToolChoiceAuto,
                  Anthropic::Models::Beta::BetaToolChoiceAny,
                  Anthropic::Models::Beta::BetaToolChoiceTool,
                  Anthropic::Models::Beta::BetaToolChoiceNone
                ),
                tools: T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaTool,
                  Anthropic::Models::Beta::BetaToolComputerUse20241022,
                  Anthropic::Models::Beta::BetaToolBash20241022,
                  Anthropic::Models::Beta::BetaToolTextEditor20241022,
                  Anthropic::Models::Beta::BetaToolComputerUse20250124,
                  Anthropic::Models::Beta::BetaToolBash20250124,
                  Anthropic::Models::Beta::BetaToolTextEditor20250124
                )
                ],
                betas: T::Array[T.any(String, Anthropic::Models::AnthropicBeta::OrSymbol)],
                request_options: Anthropic::RequestOptions
              }
            )
        end
        def to_hash
        end

        # System prompt.
        #
        #   A system prompt is a way of providing context and instructions to Claude, such
        #   as specifying a particular goal or role. See our
        #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
        module System
          extend Anthropic::Union

          Variants =
            type_template(:out) { {fixed: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam])} }

          BetaTextBlockParamArray =
            T.let(Anthropic::ArrayOf[Anthropic::Models::Beta::BetaTextBlockParam], Anthropic::Converter)

          class << self
            sig { override.returns([String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]]) }
            def variants
            end
          end
        end

        module Tool
          extend Anthropic::Union

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
                  Anthropic::Models::Beta::BetaTool,
                  Anthropic::Models::Beta::BetaToolComputerUse20241022,
                  Anthropic::Models::Beta::BetaToolBash20241022,
                  Anthropic::Models::Beta::BetaToolTextEditor20241022,
                  Anthropic::Models::Beta::BetaToolComputerUse20250124,
                  Anthropic::Models::Beta::BetaToolBash20250124,
                  Anthropic::Models::Beta::BetaToolTextEditor20250124
                )
              }
            end

          class << self
            sig do
              override
                .returns(
                  [Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022, Anthropic::Models::Beta::BetaToolComputerUse20250124, Anthropic::Models::Beta::BetaToolBash20250124, Anthropic::Models::Beta::BetaToolTextEditor20250124]
                )
            end
            def variants
            end
          end
        end
      end
    end
  end
end
