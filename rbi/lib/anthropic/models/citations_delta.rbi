# typed: strong

module Anthropic
  module Models
    class CitationsDelta < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::CitationCharLocation,
            Anthropic::Models::CitationPageLocation,
            Anthropic::Models::CitationContentBlockLocation
          )
        )
      end
      attr_accessor :citation

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citation: T.any(
            Anthropic::Models::CitationCharLocation,
            Anthropic::Models::CitationPageLocation,
            Anthropic::Models::CitationContentBlockLocation
          ),
          type: Symbol
        ).void
      end
      def initialize(citation:, type: :citations_delta)
      end

      sig do
        override.returns(
          {
            citation: T.any(
              Anthropic::Models::CitationCharLocation,
              Anthropic::Models::CitationPageLocation,
              Anthropic::Models::CitationContentBlockLocation
            ),
            type: Symbol
          }
        )
      end
      def to_hash
      end

      class Citation < Anthropic::Union
        abstract!

        sig do
          override.returns(
            [
              [Symbol, Anthropic::Models::CitationCharLocation],
              [Symbol, Anthropic::Models::CitationPageLocation],
              [Symbol, Anthropic::Models::CitationContentBlockLocation]
            ]
          )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
