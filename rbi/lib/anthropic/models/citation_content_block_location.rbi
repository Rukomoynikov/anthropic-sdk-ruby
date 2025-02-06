# typed: strong

module Anthropic
  module Models
    class CitationContentBlockLocation < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :cited_text

      sig { returns(Integer) }
      attr_accessor :document_index

      sig { returns(T.nilable(String)) }
      attr_accessor :document_title

      sig { returns(Integer) }
      attr_accessor :end_block_index

      sig { returns(Integer) }
      attr_accessor :start_block_index

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          cited_text: String,
          document_index: Integer,
          document_title: T.nilable(String),
          end_block_index: Integer,
          start_block_index: Integer,
          type: Symbol
        ).void
      end
      def initialize(
        cited_text:,
        document_index:,
        document_title:,
        end_block_index:,
        start_block_index:,
        type: :content_block_location
      )
      end

      sig do
        override.returns(
          {
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_block_index: Integer,
            start_block_index: Integer,
            type: Symbol
          }
        )
      end
      def to_hash
      end
    end
  end
end
