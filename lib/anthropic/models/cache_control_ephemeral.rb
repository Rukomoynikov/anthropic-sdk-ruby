# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # cache_control_ephemeral => {
    #   type: Anthropic::Models::CacheControlEphemeral::Type
    # }
    # ```
    class CacheControlEphemeral < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::CacheControlEphemeral::Type]
      required :type, enum: -> { Anthropic::Models::CacheControlEphemeral::Type }

      # @!parse
      #   # @param type [String]
      #   #
      #   def initialize(type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case type
      # in :ephemeral
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        EPHEMERAL = :ephemeral

        finalize!
      end
    end
  end
end
