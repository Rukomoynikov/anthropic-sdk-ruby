# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchCreateParams < Anthropic::BaseModel
          # @!attribute requests
          #   List of requests for prompt completion. Each is an individual request to create a Message.
          #
          #   @return [Array<Anthropic::Models::Beta::Messages::BatchCreateParams::Request>]
          required :requests,
                   -> { Anthropic::ArrayOf[Anthropic::Models::Beta::Messages::BatchCreateParams::Request] }

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>]
          optional :betas,
                   -> { Anthropic::ArrayOf[union: Anthropic::Models::AnthropicBeta] },
                   api_name: :"anthropic-beta"

          # @!parse
          #   # @param requests [Array<Anthropic::Models::Beta::Messages::BatchCreateParams::Request>] List of requests for prompt completion. Each is an individual request to create
          #   #   a Message.
          #   #
          #   # @param betas [Array<String>] Optional header to specify the beta version(s) you want to use.
          #   #
          #   def initialize(requests:, betas: nil, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          # ```ruby
          # request => {
          #   custom_id: String,
          #   params: Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params
          # }
          # ```
          class Request < Anthropic::BaseModel
            # @!attribute custom_id
            #   Developer-provided ID created for each request in a Message Batch. Useful for matching results to requests, as results may be given out of request order.
            #
            # Must be unique for each request within the Message Batch.
            #
            #   @return [String]
            required :custom_id, String

            # @!attribute params
            #   Messages API creation parameters for the individual request.
            #
            # See the [Messages API reference](/en/api/messages) for full documentation on available parameters.
            #
            #   @return [Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params]
            required :params, -> { Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params }

            # @!parse
            #   # @param custom_id [String] Developer-provided ID created for each request in a Message Batch. Useful for
            #   #   matching results to requests, as results may be given out of request order.
            #   #
            #   #   Must be unique for each request within the Message Batch.
            #   #
            #   # @param params [Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params] Messages API creation parameters for the individual request.
            #   #
            #   #   See the [Messages API reference](/en/api/messages) for full documentation on
            #   #   available parameters.
            #   #
            #   def initialize(custom_id:, params:, **) = super

            # def initialize: (Hash | Anthropic::BaseModel) -> void

            # @example
            # ```ruby
            # params => {
            #   max_tokens: Integer,
            #   messages: -> { Anthropic::ArrayOf[Anthropic::Models::Beta::BetaMessageParam] === _1 },
            #   model: union: Anthropic::Models::Model,
            #   metadata: Anthropic::Models::Beta::BetaMetadata,
            #   stop_sequences: -> { Anthropic::ArrayOf[String] === _1 },
            #   **_
            # }
            # ```
            class Params < Anthropic::BaseModel
              # @!attribute max_tokens
              #   The maximum number of tokens to generate before stopping.
              #
              # Note that our models may stop _before_ reaching this maximum. This parameter only specifies the absolute maximum number of tokens to generate.
              #
              # Different models have different maximum values for this parameter.  See [models](https://docs.anthropic.com/en/docs/models-overview) for details.
              #
              #   @return [Integer]
              required :max_tokens, Integer

              # @!attribute messages
              #   Input messages.
              #
              # Our models are trained to operate on alternating `user` and `assistant` conversational turns. When creating a new `Message`, you specify the prior conversational turns with the `messages` parameter, and the model then generates the next `Message` in the conversation. Consecutive `user` or `assistant` turns in your request will be combined into a single turn.
              #
              # Each input message must be an object with a `role` and `content`. You can specify a single `user`-role message, or you can include multiple `user` and `assistant` messages.
              #
              # If the final message uses the `assistant` role, the response content will continue immediately from the content in that message. This can be used to constrain part of the model's response.
              #
              # Example with a single `user` message:
              #
              # ```json
              # [{"role": "user", "content": "Hello, Claude"}]
              # ```
              #
              # Example with multiple conversational turns:
              #
              # ```json
              # [
              #   {"role": "user", "content": "Hello there."},
              #   {"role": "assistant", "content": "Hi, I'm Claude. How can I help you?"},
              #   {"role": "user", "content": "Can you explain LLMs in plain English?"},
              # ]
              # ```
              #
              # Example with a partially-filled response from Claude:
              #
              # ```json
              # [
              #   {"role": "user", "content": "What's the Greek name for Sun? (A) Sol (B) Helios (C) Sun"},
              #   {"role": "assistant", "content": "The best answer is ("},
              # ]
              # ```
              #
              # Each input message `content` may be either a single `string` or an array of content blocks, where each block has a specific `type`. Using a `string` for `content` is shorthand for an array of one content block of type `"text"`. The following input messages are equivalent:
              #
              # ```json
              # {"role": "user", "content": "Hello, Claude"}
              # ```
              #
              # ```json
              # {"role": "user", "content": [{"type": "text", "text": "Hello, Claude"}]}
              # ```
              #
              # Starting with Claude 3 models, you can also send image content blocks:
              #
              # ```json
              # {"role": "user", "content": [
              #   {
              #     "type": "image",
              #     "source": {
              #       "type": "base64",
              #       "media_type": "image/jpeg",
              #       "data": "/9j/4AAQSkZJRg...",
              #     }
              #   },
              #   {"type": "text", "text": "What is in this image?"}
              # ]}
              # ```
              #
              # We currently support the `base64` source type for images, and the `image/jpeg`, `image/png`, `image/gif`, and `image/webp` media types.
              #
              # See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for more input examples.
              #
              # Note that if you want to include a [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use the top-level `system` parameter — there is no `"system"` role for input messages in the Messages API.
              #
              #   @return [Array<Anthropic::Models::Beta::BetaMessageParam>]
              required :messages, -> { Anthropic::ArrayOf[Anthropic::Models::Beta::BetaMessageParam] }

              # @!attribute model
              #   The model that will complete your prompt.\n\nSee [models](https://docs.anthropic.com/en/docs/models-overview) for additional details and options.
              #
              #   @return [String, Symbol, Anthropic::Models::Model::UnionMember1]
              required :model, union: -> { Anthropic::Models::Model }

              # @!attribute metadata
              #   An object describing metadata about the request.
              #
              #   @return [Anthropic::Models::Beta::BetaMetadata]
              optional :metadata, -> { Anthropic::Models::Beta::BetaMetadata }

              # @!attribute stop_sequences
              #   Custom text sequences that will cause the model to stop generating.
              #
              # Our models will normally stop when they have naturally completed their turn, which will result in a response `stop_reason` of `"end_turn"`.
              #
              # If you want the model to stop generating when it encounters custom strings of text, you can use the `stop_sequences` parameter. If the model encounters one of the custom sequences, the response `stop_reason` value will be `"stop_sequence"` and the response `stop_sequence` value will contain the matched stop sequence.
              #
              #   @return [Array<String>]
              optional :stop_sequences, Anthropic::ArrayOf[String]

              # @!attribute stream
              #   Whether to incrementally stream the response using server-sent events.
              #
              # See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for details.
              #
              #   @return [Boolean]
              optional :stream, Anthropic::BooleanModel

              # @!attribute system_
              #   System prompt.
              #
              # A system prompt is a way of providing context and instructions to Claude, such as specifying a particular goal or role. See our [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
              #
              #   @return [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>]
              optional :system_,
                       union: -> {
                         Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params::System
                       },
                       api_name: :system

              # @!attribute temperature
              #   Amount of randomness injected into the response.
              #
              # Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0` for analytical / multiple choice, and closer to `1.0` for creative and generative tasks.
              #
              # Note that even with `temperature` of `0.0`, the results will not be fully deterministic.
              #
              #   @return [Float]
              optional :temperature, Float

              # @!attribute tool_choice
              #   How the model should use the provided tools. The model can use a specific tool, any available tool, or decide by itself.
              #
              #   @return [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool]
              optional :tool_choice, union: -> { Anthropic::Models::Beta::BetaToolChoice }

              # @!attribute tools
              #   Definitions of tools that the model may use.
              #
              # If you include `tools` in your API request, the model may return `tool_use` content blocks that represent the model's use of those tools. You can then run those tools using the tool input generated by the model and then optionally return results back to the model using `tool_result` content blocks.
              #
              # Each tool definition includes:
              #
              # * `name`: Name of the tool.
              # * `description`: Optional, but strongly-recommended description of the tool.
              # * `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input` shape that the model will produce in `tool_use` output content blocks.
              #
              # For example, if you defined `tools` as:
              #
              # ```json
              # [
              #   {
              #     "name": "get_stock_price",
              #     "description": "Get the current stock price for a given ticker symbol.",
              #     "input_schema": {
              #       "type": "object",
              #       "properties": {
              #         "ticker": {
              #           "type": "string",
              #           "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
              #         }
              #       },
              #       "required": ["ticker"]
              #     }
              #   }
              # ]
              # ```
              #
              # And then asked the model "What's the S&P 500 at today?", the model might produce `tool_use` content blocks in the response like this:
              #
              # ```json
              # [
              #   {
              #     "type": "tool_use",
              #     "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
              #     "name": "get_stock_price",
              #     "input": { "ticker": "^GSPC" }
              #   }
              # ]
              # ```
              #
              # You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an input, and return the following back to the model in a subsequent `user` message:
              #
              # ```json
              # [
              #   {
              #     "type": "tool_result",
              #     "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
              #     "content": "259.75 USD"
              #   }
              # ]
              # ```
              #
              # Tools can be used for workflows that include running client-side tools and functions, or more generally whenever you want the model to produce a particular JSON structure of output.
              #
              # See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
              #
              #   @return [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022>]
              optional :tools, -> { Anthropic::ArrayOf[union: Anthropic::Models::Beta::BetaToolUnion] }

              # @!attribute top_k
              #   Only sample from the top K options for each subsequent token.
              #
              # Used to remove "long tail" low probability responses. [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
              #
              # Recommended for advanced use cases only. You usually only need to use `temperature`.
              #
              #   @return [Integer]
              optional :top_k, Integer

              # @!attribute top_p
              #   Use nucleus sampling.
              #
              # In nucleus sampling, we compute the cumulative distribution over all the options for each subsequent token in decreasing probability order and cut it off once it reaches a particular probability specified by `top_p`. You should either alter `temperature` or `top_p`, but not both.
              #
              # Recommended for advanced use cases only. You usually only need to use `temperature`.
              #
              #   @return [Float]
              optional :top_p, Float

              # @!parse
              #   # Messages API creation parameters for the individual request.
              #   #
              #   #   See the [Messages API reference](/en/api/messages) for full documentation on
              #   #   available parameters.
              #   #
              #   # @param max_tokens [Integer] The maximum number of tokens to generate before stopping.
              #   #
              #   #   Note that our models may stop _before_ reaching this maximum. This parameter
              #   #   only specifies the absolute maximum number of tokens to generate.
              #   #
              #   #   Different models have different maximum values for this parameter. See
              #   #   [models](https://docs.anthropic.com/en/docs/models-overview) for details.
              #   #
              #   # @param messages [Array<Anthropic::Models::Beta::BetaMessageParam>] Input messages.
              #   #
              #   #   Our models are trained to operate on alternating `user` and `assistant`
              #   #   conversational turns. When creating a new `Message`, you specify the prior
              #   #   conversational turns with the `messages` parameter, and the model then generates
              #   #   the next `Message` in the conversation. Consecutive `user` or `assistant` turns
              #   #   in your request will be combined into a single turn.
              #   #
              #   #   Each input message must be an object with a `role` and `content`. You can
              #   #   specify a single `user`-role message, or you can include multiple `user` and
              #   #   `assistant` messages.
              #   #
              #   #   If the final message uses the `assistant` role, the response content will
              #   #   continue immediately from the content in that message. This can be used to
              #   #   constrain part of the model's response.
              #   #
              #   #   Example with a single `user` message:
              #   #
              #   #   ```json
              #   #   [{ "role": "user", "content": "Hello, Claude" }]
              #   #   ```
              #   #
              #   #   Example with multiple conversational turns:
              #   #
              #   #   ```json
              #   #   [
              #   #     { "role": "user", "content": "Hello there." },
              #   #     { "role": "assistant", "content": "Hi, I'm Claude. How can I help you?" },
              #   #     { "role": "user", "content": "Can you explain LLMs in plain English?" }
              #   #   ]
              #   #   ```
              #   #
              #   #   Example with a partially-filled response from Claude:
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
              #   #   Each input message `content` may be either a single `string` or an array of
              #   #   content blocks, where each block has a specific `type`. Using a `string` for
              #   #   `content` is shorthand for an array of one content block of type `"text"`. The
              #   #   following input messages are equivalent:
              #   #
              #   #   ```json
              #   #   { "role": "user", "content": "Hello, Claude" }
              #   #   ```
              #   #
              #   #   ```json
              #   #   { "role": "user", "content": [{ "type": "text", "text": "Hello, Claude" }] }
              #   #   ```
              #   #
              #   #   Starting with Claude 3 models, you can also send image content blocks:
              #   #
              #   #   ```json
              #   #   {
              #   #     "role": "user",
              #   #     "content": [
              #   #       {
              #   #         "type": "image",
              #   #         "source": {
              #   #           "type": "base64",
              #   #           "media_type": "image/jpeg",
              #   #           "data": "/9j/4AAQSkZJRg..."
              #   #         }
              #   #       },
              #   #       { "type": "text", "text": "What is in this image?" }
              #   #     ]
              #   #   }
              #   #   ```
              #   #
              #   #   We currently support the `base64` source type for images, and the `image/jpeg`,
              #   #   `image/png`, `image/gif`, and `image/webp` media types.
              #   #
              #   #   See [examples](https://docs.anthropic.com/en/api/messages-examples#vision) for
              #   #   more input examples.
              #   #
              #   #   Note that if you want to include a
              #   #   [system prompt](https://docs.anthropic.com/en/docs/system-prompts), you can use
              #   #   the top-level `system` parameter — there is no `"system"` role for input
              #   #   messages in the Messages API.
              #   #
              #   # @param model [String] The model that will complete your prompt.\n\nSee
              #   #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
              #   #   details and options.
              #   #
              #   # @param metadata [Anthropic::Models::Beta::BetaMetadata] An object describing metadata about the request.
              #   #
              #   # @param stop_sequences [Array<String>] Custom text sequences that will cause the model to stop generating.
              #   #
              #   #   Our models will normally stop when they have naturally completed their turn,
              #   #   which will result in a response `stop_reason` of `"end_turn"`.
              #   #
              #   #   If you want the model to stop generating when it encounters custom strings of
              #   #   text, you can use the `stop_sequences` parameter. If the model encounters one of
              #   #   the custom sequences, the response `stop_reason` value will be `"stop_sequence"`
              #   #   and the response `stop_sequence` value will contain the matched stop sequence.
              #   #
              #   # @param stream [Boolean] Whether to incrementally stream the response using server-sent events.
              #   #
              #   #   See [streaming](https://docs.anthropic.com/en/api/messages-streaming) for
              #   #   details.
              #   #
              #   # @param system_ [String, Array<Anthropic::Models::Beta::BetaTextBlockParam>] System prompt.
              #   #
              #   #   A system prompt is a way of providing context and instructions to Claude, such
              #   #   as specifying a particular goal or role. See our
              #   #   [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
              #   #
              #   # @param temperature [Float] Amount of randomness injected into the response.
              #   #
              #   #   Defaults to `1.0`. Ranges from `0.0` to `1.0`. Use `temperature` closer to `0.0`
              #   #   for analytical / multiple choice, and closer to `1.0` for creative and
              #   #   generative tasks.
              #   #
              #   #   Note that even with `temperature` of `0.0`, the results will not be fully
              #   #   deterministic.
              #   #
              #   # @param tool_choice [Anthropic::Models::Beta::BetaToolChoiceAuto, Anthropic::Models::Beta::BetaToolChoiceAny, Anthropic::Models::Beta::BetaToolChoiceTool] How the model should use the provided tools. The model can use a specific tool,
              #   #   any available tool, or decide by itself.
              #   #
              #   # @param tools [Array<Anthropic::Models::Beta::BetaTool, Anthropic::Models::Beta::BetaToolComputerUse20241022, Anthropic::Models::Beta::BetaToolBash20241022, Anthropic::Models::Beta::BetaToolTextEditor20241022>] Definitions of tools that the model may use.
              #   #
              #   #   If you include `tools` in your API request, the model may return `tool_use`
              #   #   content blocks that represent the model's use of those tools. You can then run
              #   #   those tools using the tool input generated by the model and then optionally
              #   #   return results back to the model using `tool_result` content blocks.
              #   #
              #   #   Each tool definition includes:
              #   #
              #   #   - `name`: Name of the tool.
              #   #   - `description`: Optional, but strongly-recommended description of the tool.
              #   #   - `input_schema`: [JSON schema](https://json-schema.org/) for the tool `input`
              #   #     shape that the model will produce in `tool_use` output content blocks.
              #   #
              #   #   For example, if you defined `tools` as:
              #   #
              #   #   ```json
              #   #   [
              #   #     {
              #   #       "name": "get_stock_price",
              #   #       "description": "Get the current stock price for a given ticker symbol.",
              #   #       "input_schema": {
              #   #         "type": "object",
              #   #         "properties": {
              #   #           "ticker": {
              #   #             "type": "string",
              #   #             "description": "The stock ticker symbol, e.g. AAPL for Apple Inc."
              #   #           }
              #   #         },
              #   #         "required": ["ticker"]
              #   #       }
              #   #     }
              #   #   ]
              #   #   ```
              #   #
              #   #   And then asked the model "What's the S&P 500 at today?", the model might produce
              #   #   `tool_use` content blocks in the response like this:
              #   #
              #   #   ```json
              #   #   [
              #   #     {
              #   #       "type": "tool_use",
              #   #       "id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
              #   #       "name": "get_stock_price",
              #   #       "input": { "ticker": "^GSPC" }
              #   #     }
              #   #   ]
              #   #   ```
              #   #
              #   #   You might then run your `get_stock_price` tool with `{"ticker": "^GSPC"}` as an
              #   #   input, and return the following back to the model in a subsequent `user`
              #   #   message:
              #   #
              #   #   ```json
              #   #   [
              #   #     {
              #   #       "type": "tool_result",
              #   #       "tool_use_id": "toolu_01D7FLrfh4GYq7yT1ULFeyMV",
              #   #       "content": "259.75 USD"
              #   #     }
              #   #   ]
              #   #   ```
              #   #
              #   #   Tools can be used for workflows that include running client-side tools and
              #   #   functions, or more generally whenever you want the model to produce a particular
              #   #   JSON structure of output.
              #   #
              #   #   See our [guide](https://docs.anthropic.com/en/docs/tool-use) for more details.
              #   #
              #   # @param top_k [Integer] Only sample from the top K options for each subsequent token.
              #   #
              #   #   Used to remove "long tail" low probability responses.
              #   #   [Learn more technical details here](https://towardsdatascience.com/how-to-sample-from-language-models-682bceb97277).
              #   #
              #   #   Recommended for advanced use cases only. You usually only need to use
              #   #   `temperature`.
              #   #
              #   # @param top_p [Float] Use nucleus sampling.
              #   #
              #   #   In nucleus sampling, we compute the cumulative distribution over all the options
              #   #   for each subsequent token in decreasing probability order and cut it off once it
              #   #   reaches a particular probability specified by `top_p`. You should either alter
              #   #   `temperature` or `top_p`, but not both.
              #   #
              #   #   Recommended for advanced use cases only. You usually only need to use
              #   #   `temperature`.
              #   #
              #   def initialize(
              #     max_tokens:,
              #     messages:,
              #     model:,
              #     metadata: nil,
              #     stop_sequences: nil,
              #     stream: nil,
              #     system_: nil,
              #     temperature: nil,
              #     tool_choice: nil,
              #     tools: nil,
              #     top_k: nil,
              #     top_p: nil,
              #     **
              #   )
              #     super
              #   end

              # def initialize: (Hash | Anthropic::BaseModel) -> void

              # System prompt.
              #
              # A system prompt is a way of providing context and instructions to Claude, such as specifying a particular goal or role. See our [guide to system prompts](https://docs.anthropic.com/en/docs/system-prompts).
              #
              # @example
              # ```ruby
              # case system
              # in String
              #   # ...
              # in Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params::System::BetaTextBlockParamArray
              #   # ...
              # end
              # ```
              class System < Anthropic::Union
                BetaTextBlockParamArray = Anthropic::ArrayOf[-> {
                  Anthropic::Models::Beta::BetaTextBlockParam
                }]

                variant String

                variant Anthropic::Models::Beta::Messages::BatchCreateParams::Request::Params::System::BetaTextBlockParamArray
              end
            end
          end
        end
      end
    end
  end
end
