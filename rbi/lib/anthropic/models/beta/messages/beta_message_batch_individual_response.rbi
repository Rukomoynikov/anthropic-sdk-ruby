# typed: strong

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatchIndividualResponse < Anthropic::Internal::Type::BaseModel
          # Developer-provided ID created for each request in a Message Batch. Useful for
          # matching results to requests, as results may be given out of request order.
          #
          # Must be unique for each request within the Message Batch.
          sig { returns(String) }
          attr_accessor :custom_id

          # Processing result for this request.
          #
          # Contains a Message output if processing was successful, an error response if
          # processing failed, or the reason why processing was not attempted, such as
          # cancellation or expiration.
          sig do
            returns(
              T.any(
                Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
              )
            )
          end
          attr_accessor :result

          # This is a single line in the response `.jsonl` file and does not represent the
          # response as a whole.
          sig do
            params(
              custom_id: String,
              result: T.any(
                Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                Anthropic::Internal::AnyHash,
                Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
              )
            )
              .returns(T.attached_class)
          end
          def self.new(custom_id:, result:); end

          sig do
            override
              .returns(
                {
                  custom_id: String,
                  result: T.any(
                    Anthropic::Models::Beta::Messages::BetaMessageBatchSucceededResult,
                    Anthropic::Models::Beta::Messages::BetaMessageBatchErroredResult,
                    Anthropic::Models::Beta::Messages::BetaMessageBatchCanceledResult,
                    Anthropic::Models::Beta::Messages::BetaMessageBatchExpiredResult
                  )
                }
              )
          end
          def to_hash; end
        end
      end
    end
  end
end
