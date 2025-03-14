# typed: strong

module Anthropic
  # @api private
  module BaseStream
    Message = type_member(:in)
    Elem = type_member(:out)

    sig { void }
    def close
    end

    # @api private
    sig { overridable.returns(T::Enumerable[Elem]) }
    private def iterator
    end

    sig { params(blk: T.proc.params(arg0: Elem).void).void }
    def for_each(&blk)
    end

    sig { returns(T::Enumerable[Elem]) }
    def to_enum
    end

    alias_method :enum_for, :to_enum

    # @api private
    sig do
      params(
        model: T.any(T::Class[T.anything], Anthropic::Converter),
        url: URI::Generic,
        status: Integer,
        response: Net::HTTPResponse,
        messages: T::Enumerable[Message]
      )
        .void
    end
    def initialize(model:, url:, status:, response:, messages:)
    end
  end
end
