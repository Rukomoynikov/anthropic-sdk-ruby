# frozen_string_literal: true

module Anthropic
  module Internal
    module Type
      # @api private
      #
      # A value from among a specified list of options. OpenAPI enum values map to Ruby
      # values in the SDK as follows:
      #
      # 1. boolean => true | false
      # 2. integer => Integer
      # 3. float => Float
      # 4. string => Symbol
      #
      # We can therefore convert string values to Symbols, but can't convert other
      # values safely.
      #
      # @example
      #   # `stop_reason` is a `Anthropic::Models::StopReason`
      #   case stop_reason
      #   when Anthropic::Models::StopReason::END_TURN
      #     # ...
      #   when Anthropic::Models::StopReason::MAX_TOKENS
      #     # ...
      #   when Anthropic::Models::StopReason::STOP_SEQUENCE
      #     # ...
      #   else
      #     puts(stop_reason)
      #   end
      #
      # @example
      #   case stop_reason
      #   in :end_turn
      #     # ...
      #   in :max_tokens
      #     # ...
      #   in :stop_sequence
      #     # ...
      #   else
      #     puts(stop_reason)
      #   end
      module Enum
        include Anthropic::Internal::Type::Converter

        # All of the valid Symbol values for this enum.
        #
        # @return [Array<NilClass, Boolean, Integer, Float, Symbol>]
        def values = (@values ||= constants.map { const_get(_1) })

        # @api private
        #
        # Guard against thread safety issues by instantiating `@values`.
        private def finalize! = values

        # @param other [Object]
        #
        # @return [Boolean]
        def ===(other) = values.include?(other)

        # @param other [Object]
        #
        # @return [Boolean]
        def ==(other)
          # rubocop:disable Layout/LineLength
          other.is_a?(Module) && other.singleton_class <= Anthropic::Internal::Type::Enum && other.values.to_set == values.to_set
          # rubocop:enable Layout/LineLength
        end

        # @api private
        #
        # Unlike with primitives, `Enum` additionally validates that the value is a member
        # of the enum.
        #
        # @param value [String, Symbol, Object]
        #
        # @param state [Hash{Symbol=>Object}] .
        #
        #   @option state [Boolean, :strong] :strictness
        #
        #   @option state [Hash{Symbol=>Object}] :exactness
        #
        #   @option state [Integer] :branched
        #
        # @return [Symbol, Object]
        def coerce(value, state:)
          exactness = state.fetch(:exactness)
          val = value.is_a?(String) ? value.to_sym : value

          if values.include?(val)
            exactness[:yes] += 1
            val
          else
            exactness[values.first&.class == val.class ? :maybe : :no] += 1
            value
          end
        end

        # @!parse
        #   # @api private
        #   #
        #   # @param value [Symbol, Object]
        #   #
        #   # @param state [Hash{Symbol=>Object}] .
        #   #
        #   #   @option state [Boolean] :can_retry
        #   #
        #   # @return [Symbol, Object]
        #   def dump(value, state:) = super
      end
    end
  end
end
