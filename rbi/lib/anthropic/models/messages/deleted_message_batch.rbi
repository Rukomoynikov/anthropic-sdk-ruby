# typed: strong

module Anthropic
  module Models
    module Messages
      class DeletedMessageBatch < Anthropic::Internal::Type::BaseModel
        # ID of the Message Batch.
        sig { returns(String) }
        attr_accessor :id

        # Deleted object type.
        #
        # For Message Batches, this is always `"message_batch_deleted"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig { params(id: String, type: Symbol).returns(T.attached_class) }
        def self.new(id:, type: :message_batch_deleted); end

        sig { override.returns({id: String, type: Symbol}) }
        def to_hash; end
      end
    end
  end
end
