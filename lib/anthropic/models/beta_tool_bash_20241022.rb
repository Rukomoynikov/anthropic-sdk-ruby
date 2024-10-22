# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolBash20241022 < BaseModel
      # @!attribute [rw] name_
      #   @return [Symbol, Anthropic::Models::BetaToolBash20241022::Name]
      required :name_, api_name: :name, enum: -> { Anthropic::Models::BetaToolBash20241022::Name }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolBash20241022::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolBash20241022::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

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
      #   #   @option data [String] :name
      #   #   @option data [String] :type
      #   #   @option data [Object, nil] :cache_control
      #   def initialize(data = {}) = super
    end
  end
end
