# typed: strong

module Anthropic
  module Models
    MessageBatchResult = T.type_alias { Messages::MessageBatchResult }

    module Messages
      class MessageBatchResult < Anthropic::Union
        abstract!

        class << self
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Messages::MessageBatchSucceededResult], [Symbol, Anthropic::Models::Messages::MessageBatchErroredResult], [Symbol, Anthropic::Models::Messages::MessageBatchCanceledResult], [Symbol, Anthropic::Models::Messages::MessageBatchExpiredResult]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
