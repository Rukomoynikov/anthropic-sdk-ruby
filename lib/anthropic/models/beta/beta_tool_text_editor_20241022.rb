# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolTextEditor20241022 < Anthropic::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolTextEditor20241022::Name]
        required :name, enum: -> { Anthropic::Models::Beta::BetaToolTextEditor20241022::Name }

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolTextEditor20241022::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolTextEditor20241022::Type }

        # @!attribute cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        class Name < Anthropic::Enum
          STR_REPLACE_EDITOR = :str_replace_editor
        end

        class Type < Anthropic::Enum
          TEXT_EDITOR_20241022 = :text_editor_20241022
        end

        # @!parse
        #   # Create a new instance of BetaToolTextEditor20241022 from a Hash of raw data.
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

    BetaToolTextEditor20241022 = Beta::BetaToolTextEditor20241022
  end
end
