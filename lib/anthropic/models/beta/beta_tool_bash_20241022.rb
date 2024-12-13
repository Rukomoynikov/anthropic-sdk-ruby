# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolBash20241022 < Anthropic::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolBash20241022::Name]
        required :name, enum: -> { Anthropic::Models::Beta::BetaToolBash20241022::Name }

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolBash20241022::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolBash20241022::Type }

        # @!attribute cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        class Name < Anthropic::Enum
          BASH = :bash
        end

        class Type < Anthropic::Enum
          BASH_20241022 = :bash_20241022
        end

        # @!parse
        #   # Create a new instance of BetaToolBash20241022 from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :name Name of the tool.
        #   #
        #   #     This is how the tool will be called by the model and in tool_use blocks.
        #   #   @option data [String] :type
        #   #   @option data [Object, nil] :cache_control
        #   def initialize(data = {}) = super
      end
    end

    BetaToolBash20241022 = Beta::BetaToolBash20241022
  end
end
