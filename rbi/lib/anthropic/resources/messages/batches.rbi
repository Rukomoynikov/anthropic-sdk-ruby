# typed: strong

module Anthropic
  module Resources
    class Messages
      class Batches
        sig do
          params(
            params: T.any(Anthropic::Models::Messages::BatchCreateParams, T::Hash[Symbol, T.anything]),
            requests: T::Array[Anthropic::Models::Messages::BatchCreateParams::Request],
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Messages::MessageBatch)
        end
        def create(params, requests:, request_options: {}); end

        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Messages::MessageBatch)
        end
        def retrieve(message_batch_id, request_options: {}); end

        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Page[Anthropic::Models::Messages::MessageBatch])
        end
        def list(after_id:, before_id:, limit:, request_options: {}); end

        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Messages::DeletedMessageBatch)
        end
        def delete(message_batch_id, request_options: {}); end

        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Messages::MessageBatch)
        end
        def cancel(message_batch_id, request_options: {}); end

        sig do
          params(
            message_batch_id: String,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Messages::MessageBatchIndividualResponse)
        end
        def results(message_batch_id, request_options: {}); end

        sig { params(client: Anthropic::Client).void }
        def initialize(client:); end
      end
    end
  end
end
