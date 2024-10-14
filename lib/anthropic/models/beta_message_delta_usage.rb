# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMessageDeltaUsage < BaseModel
      # @!attribute [rw] output_tokens
      #   The cumulative number of output tokens which were used.
      #   @return [Integer]
      required :output_tokens, Integer

      # Create a new instance of BetaMessageDeltaUsage from a Hash of raw data.
      #
      # @overload initialize(output_tokens: nil)
      # @param output_tokens [Integer] The cumulative number of output tokens which were used.
      def initialize(data = {})
        super
      end
    end
  end
end
