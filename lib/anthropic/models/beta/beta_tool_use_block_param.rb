# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_use_block_param => {
      #   id: String,
      #   input: Anthropic::Unknown,
      #   name: String,
      #   type: :tool_use,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral
      # }
      # ```
      class BetaToolUseBlockParam < Anthropic::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #
        #   @return [Object]
        required :input, Anthropic::Unknown

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, :tool_use]
        required :type, const: :tool_use

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param id [String]
        #   # @param input [Object]
        #   # @param name [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param type [Symbol, :tool_use]
        #   #
        #   def initialize(id:, input:, name:, cache_control: nil, type: :tool_use, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaToolUseBlockParam = Beta::BetaToolUseBlockParam
  end
end
