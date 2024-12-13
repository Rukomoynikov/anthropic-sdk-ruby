# frozen_string_literal: true

module Anthropic
  module Models
    class MessageDeltaUsage < Anthropic::BaseModel
      # @!attribute output_tokens
      #   The cumulative number of output tokens which were used.
      #   @return [Integer]
      required :output_tokens, Integer

      # @!parse
      #   # Create a new instance of MessageDeltaUsage from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :output_tokens The cumulative number of output tokens which were used.
      #   def initialize(data = {}) = super
    end
  end
end
