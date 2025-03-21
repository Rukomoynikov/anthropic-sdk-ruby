# typed: strong

module Anthropic
  module Models
    module Messages
      class MessageBatchRequestCounts < Anthropic::BaseModel
        # Number of requests in the Message Batch that have been canceled.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :canceled

        # Number of requests in the Message Batch that encountered an error.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :errored

        # Number of requests in the Message Batch that have expired.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :expired

        # Number of requests in the Message Batch that are processing.
        sig { returns(Integer) }
        attr_accessor :processing

        # Number of requests in the Message Batch that have completed successfully.
        #
        #   This is zero until processing of the entire Message Batch has ended.
        sig { returns(Integer) }
        attr_accessor :succeeded

        sig do
          params(
            canceled: Integer,
            errored: Integer,
            expired: Integer,
            processing: Integer,
            succeeded: Integer
          )
            .returns(T.attached_class)
        end
        def self.new(canceled:, errored:, expired:, processing:, succeeded:)
        end

        sig do
          override
            .returns({
                       canceled: Integer,
                       errored: Integer,
                       expired: Integer,
                       processing: Integer,
                       succeeded: Integer
                     })
        end
        def to_hash
        end
      end
    end

    MessageBatchRequestCounts = Messages::MessageBatchRequestCounts
  end
end
