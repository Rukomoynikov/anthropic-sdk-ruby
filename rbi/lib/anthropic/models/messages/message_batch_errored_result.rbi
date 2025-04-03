# typed: strong

module Anthropic
  module Models
    module Messages
      class MessageBatchErroredResult < Anthropic::BaseModel
        sig { returns(Anthropic::Models::ErrorResponse) }
        attr_reader :error

        sig { params(error: T.any(Anthropic::Models::ErrorResponse, Anthropic::Internal::Util::AnyHash)).void }
        attr_writer :error

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(error: T.any(Anthropic::Models::ErrorResponse, Anthropic::Internal::Util::AnyHash), type: Symbol)
            .returns(T.attached_class)
        end
        def self.new(error:, type: :errored)
        end

        sig { override.returns({error: Anthropic::Models::ErrorResponse, type: Symbol}) }
        def to_hash
        end
      end
    end

    MessageBatchErroredResult = Messages::MessageBatchErroredResult
  end
end
