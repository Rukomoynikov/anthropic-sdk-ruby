# typed: strong

module Anthropic
  module Resources
    class Beta
      class Messages
        sig { returns(Anthropic::Resources::Beta::Messages::Batches) }
        def batches
        end

        sig do
          params(
            max_tokens: Integer,
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            stream: T::Boolean,
            metadata: Anthropic::Models::Beta::BetaMetadata,
            stop_sequences: T::Array[String],
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            temperature: Float,
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124,
              Anthropic::Models::Beta::BetaTool
            )
            ],
            top_k: Integer,
            top_p: Float,
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Anthropic::Models::Beta::BetaMessage)
        end
        def create(
          max_tokens:,
          messages:,
          model:,
          stream: nil,
          metadata: nil,
          stop_sequences: nil,
          system_: nil,
          temperature: nil,
          thinking: nil,
          tool_choice: nil,
          tools: nil,
          top_k: nil,
          top_p: nil,
          betas: nil,
          request_options: {}
        )
        end

        sig do
          params(
            messages: T::Array[Anthropic::Models::Beta::BetaMessageParam],
            model: T.any(Symbol, String),
            system_: T.any(String, T::Array[Anthropic::Models::Beta::BetaTextBlockParam]),
            thinking: T.any(
              Anthropic::Models::Beta::BetaThinkingConfigEnabled,
              Anthropic::Models::Beta::BetaThinkingConfigDisabled
            ),
            tool_choice: T.any(
              Anthropic::Models::Beta::BetaToolChoiceAuto,
              Anthropic::Models::Beta::BetaToolChoiceAny,
              Anthropic::Models::Beta::BetaToolChoiceTool
            ),
            tools: T::Array[
            T.any(
              Anthropic::Models::Beta::BetaToolComputerUse20241022,
              Anthropic::Models::Beta::BetaToolBash20241022,
              Anthropic::Models::Beta::BetaToolTextEditor20241022,
              Anthropic::Models::Beta::BetaToolComputerUse20250124,
              Anthropic::Models::Beta::BetaToolBash20250124,
              Anthropic::Models::Beta::BetaToolTextEditor20250124,
              Anthropic::Models::Beta::BetaTool
            )
            ],
            betas: T::Array[T.any(String, Symbol)],
            request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
          )
            .returns(Anthropic::Models::Beta::BetaMessageTokensCount)
        end
        def count_tokens(
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

        sig { params(client: Anthropic::Client).void }
        def initialize(client:)
        end
      end
    end
  end
end
