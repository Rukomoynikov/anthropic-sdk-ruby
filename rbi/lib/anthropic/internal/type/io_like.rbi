# typed: strong

module Anthropic
  module Internal
    module Type
      # @api private
      #
      # Either `Pathname` or `StringIO`.
      class IOLike
        extend Anthropic::Internal::Type::Converter

        abstract!
        final!

        sig(:final) { params(other: T.anything).returns(T::Boolean) }
        def self.===(other); end

        sig(:final) { params(other: T.anything).returns(T::Boolean) }
        def self.==(other); end

        class << self
          # @api private
          sig(:final) do
            override
              .params(
                value: T.any(StringIO, String, T.anything),
                state: Anthropic::Internal::Type::Converter::CoerceState
              )
              .returns(T.any(StringIO, T.anything))
          end
          def coerce(value, state:); end

          # @api private
          sig(:final) do
            override
              .params(
                value: T.any(Pathname, StringIO, IO, String, T.anything),
                state: Anthropic::Internal::Type::Converter::DumpState
              )
              .returns(T.any(Pathname, StringIO, IO, String, T.anything))
          end
          def dump(value, state:); end
        end
      end
    end
  end
end
