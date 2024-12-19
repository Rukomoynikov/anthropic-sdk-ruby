# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BetaMessageBatch < Anthropic::BaseModel
          # @!attribute id
          #   Unique object identifier.
          #
          # The format and length of IDs may change over time.
          #
          #   @return [String]
          required :id, String

          # @!attribute archived_at
          #   RFC 3339 datetime string representing the time at which the Message Batch was archived and its results became unavailable.
          #
          #   @return [Time]
          required :archived_at, Time

          # @!attribute cancel_initiated_at
          #   RFC 3339 datetime string representing the time at which cancellation was initiated for the Message Batch. Specified only if cancellation was initiated.
          #
          #   @return [Time]
          required :cancel_initiated_at, Time

          # @!attribute created_at
          #   RFC 3339 datetime string representing the time at which the Message Batch was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute ended_at
          #   RFC 3339 datetime string representing the time at which processing for the Message Batch ended. Specified only once processing ends.
          #
          # Processing ends when every request in a Message Batch has either succeeded, errored, canceled, or expired.
          #
          #   @return [Time]
          required :ended_at, Time

          # @!attribute expires_at
          #   RFC 3339 datetime string representing the time at which the Message Batch will expire and end processing, which is 24 hours after creation.
          #
          #   @return [Time]
          required :expires_at, Time

          # @!attribute processing_status
          #   Processing status of the Message Batch.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus]
          required :processing_status,
                   enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatch::ProcessingStatus }

          # @!attribute request_counts
          #   Tallies requests within the Message Batch, categorized by their status.
          #
          # Requests start as `processing` and move to one of the other statuses only once processing of the entire batch ends. The sum of all values always matches the total number of requests in the batch.
          #
          #   @return [Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts]
          required :request_counts, -> { Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts }

          # @!attribute results_url
          #   URL to a `.jsonl` file containing the results of the Message Batch requests. Specified only once processing ends.
          #
          # Results in the file are not guaranteed to be in the same order as requests. Use the `custom_id` field to match results to requests.
          #
          #   @return [String]
          required :results_url, String

          # @!attribute type
          #   Object type.
          #
          # For Message Batches, this is always `"message_batch"`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Messages::BetaMessageBatch::Type]
          required :type, enum: -> { Anthropic::Models::Beta::Messages::BetaMessageBatch::Type }

          # @!parse
          #   # @param id [String] Unique object identifier.
          #   #
          #   #   The format and length of IDs may change over time.
          #   #
          #   # @param archived_at [String, nil] RFC 3339 datetime string representing the time at which the Message Batch was
          #   #   archived and its results became unavailable.
          #   #
          #   # @param cancel_initiated_at [String, nil] RFC 3339 datetime string representing the time at which cancellation was
          #   #   initiated for the Message Batch. Specified only if cancellation was initiated.
          #   #
          #   # @param created_at [String] RFC 3339 datetime string representing the time at which the Message Batch was
          #   #   created.
          #   #
          #   # @param ended_at [String, nil] RFC 3339 datetime string representing the time at which processing for the
          #   #   Message Batch ended. Specified only once processing ends.
          #   #
          #   #   Processing ends when every request in a Message Batch has either succeeded,
          #   #   errored, canceled, or expired.
          #   #
          #   # @param expires_at [String] RFC 3339 datetime string representing the time at which the Message Batch will
          #   #   expire and end processing, which is 24 hours after creation.
          #   #
          #   # @param processing_status [String] Processing status of the Message Batch.
          #   #
          #   # @param request_counts [Anthropic::Models::Beta::Messages::BetaMessageBatchRequestCounts] Tallies requests within the Message Batch, categorized by their status.
          #   #
          #   #   Requests start as `processing` and move to one of the other statuses only once
          #   #   processing of the entire batch ends. The sum of all values always matches the
          #   #   total number of requests in the batch.
          #   #
          #   # @param results_url [String, nil] URL to a `.jsonl` file containing the results of the Message Batch requests.
          #   #   Specified only once processing ends.
          #   #
          #   #   Results in the file are not guaranteed to be in the same order as requests. Use
          #   #   the `custom_id` field to match results to requests.
          #   #
          #   # @param type [String] Object type.
          #   #
          #   #   For Message Batches, this is always `"message_batch"`.
          #   #
          #   def initialize(
          #     id:,
          #     archived_at:,
          #     cancel_initiated_at:,
          #     created_at:,
          #     ended_at:,
          #     expires_at:,
          #     processing_status:,
          #     request_counts:,
          #     results_url:,
          #     type:
          #   )
          #     super
          #   end

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # Processing status of the Message Batch.
          #
          # @example
          #
          # ```ruby
          # case enum
          # in :in_progress
          #   # ...
          # in :canceling
          #   # ...
          # in :ended
          #   # ...
          # end
          # ```
          class ProcessingStatus < Anthropic::Enum
            IN_PROGRESS = :in_progress
            CANCELING = :canceling
            ENDED = :ended
          end

          # Object type.
          #
          # For Message Batches, this is always `"message_batch"`.
          #
          # @example
          #
          # ```ruby
          # case enum
          # in :message_batch
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            MESSAGE_BATCH = :message_batch
          end
        end
      end
    end
  end
end
