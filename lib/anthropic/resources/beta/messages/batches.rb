# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Messages
        class Batches
          # Send a batch of Message creation requests.
          #
          #   The Message Batches API can be used to process multiple Messages API requests at
          #   once. Once a Message Batch is created, it begins processing immediately. Batches
          #   can take up to 24 hours to complete.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload create(requests:, betas: nil, request_options: {})
          #
          # @param requests [Array<Anthropic::Models::Beta::Messages::BatchCreateParams::Request>]
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          #
          # @see Anthropic::Models::Beta::Messages::BatchCreateParams
          def create(params)
            parsed, options = Anthropic::Models::Beta::Messages::BatchCreateParams.dump_request(params)
            header_params = [:"anthropic-beta"]
            @client.request(
              method: :post,
              path: "v1/messages/batches?beta=true",
              headers: parsed.slice(*header_params),
              body: parsed.except(*header_params),
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # This endpoint is idempotent and can be used to poll for Message Batch
          #   completion. To access the results of a Message Batch, make a request to the
          #   `results_url` field in the response.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload retrieve(message_batch_id, betas: nil, request_options: {})
          #
          # @param message_batch_id [String]
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          #
          # @see Anthropic::Models::Beta::Messages::BatchRetrieveParams
          def retrieve(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchRetrieveParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/messages/batches/%1$s?beta=true", message_batch_id],
              headers: parsed,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # List all Message Batches within a Workspace. Most recently created batches are
          #   returned first.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload list(after_id: nil, before_id: nil, limit: nil, betas: nil, request_options: {})
          #
          # @param after_id [String]
          # @param before_id [String]
          # @param limit [Integer]
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::Messages::BetaMessageBatch>]
          #
          # @see Anthropic::Models::Beta::Messages::BatchListParams
          def list(params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchListParams.dump_request(params)
            query_params = [:after_id, :before_id, :limit]
            @client.request(
              method: :get,
              path: "v1/messages/batches?beta=true",
              query: parsed.slice(*query_params),
              headers: parsed.except(*query_params),
              page: Anthropic::Internal::Page,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # Delete a Message Batch.
          #
          #   Message Batches can only be deleted once they've finished processing. If you'd
          #   like to delete an in-progress batch, you must first cancel it.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload delete(message_batch_id, betas: nil, request_options: {})
          #
          # @param message_batch_id [String]
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch]
          #
          # @see Anthropic::Models::Beta::Messages::BatchDeleteParams
          def delete(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchDeleteParams.dump_request(params)
            @client.request(
              method: :delete,
              path: ["v1/messages/batches/%1$s?beta=true", message_batch_id],
              headers: parsed,
              model: Anthropic::Models::Beta::Messages::BetaDeletedMessageBatch,
              options: options
            )
          end

          # Batches may be canceled any time before processing ends. Once cancellation is
          #   initiated, the batch enters a `canceling` state, at which time the system may
          #   complete any in-progress, non-interruptible requests before finalizing
          #   cancellation.
          #
          #   The number of canceled requests is specified in `request_counts`. To determine
          #   which requests were canceled, check the individual results within the batch.
          #   Note that cancellation may not result in any canceled requests if they were
          #   non-interruptible.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload cancel(message_batch_id, betas: nil, request_options: {})
          #
          # @param message_batch_id [String]
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Messages::BetaMessageBatch]
          #
          # @see Anthropic::Models::Beta::Messages::BatchCancelParams
          def cancel(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchCancelParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/messages/batches/%1$s/cancel?beta=true", message_batch_id],
              headers: parsed,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatch,
              options: options
            )
          end

          # Streams the results of a Message Batch as a `.jsonl` file.
          #
          #   Each line in the file is a JSON object containing the result of a single request
          #   in the Message Batch. Results are not guaranteed to be in the same order as
          #   requests. Use the `custom_id` field to match results to requests.
          #
          #   Learn more about the Message Batches API in our
          #   [user guide](/en/docs/build-with-claude/batch-processing)
          #
          # @overload results(message_batch_id, betas: nil, request_options: {})
          #
          # @param message_batch_id [String]
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>]
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::JsonLStream<Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse>]
          #
          # @see Anthropic::Models::Beta::Messages::BatchResultsParams
          def results(message_batch_id, params = {})
            parsed, options = Anthropic::Models::Beta::Messages::BatchResultsParams.dump_request(params)
            @client.request(
              method: :get,
              path: ["v1/messages/batches/%1$s/results?beta=true", message_batch_id],
              headers: {"accept" => "application/x-jsonl", **parsed},
              stream: Anthropic::Internal::JsonLStream,
              model: Anthropic::Models::Beta::Messages::BetaMessageBatchIndividualResponse,
              options: options
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
