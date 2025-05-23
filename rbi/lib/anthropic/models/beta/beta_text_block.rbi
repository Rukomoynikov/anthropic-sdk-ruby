# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaTextBlock < Anthropic::Internal::Type::BaseModel
        # Citations supporting the text block.
        #
        # The type of citation returned will depend on the type of document being cited.
        # Citing a PDF results in `page_location`, plain text results in `char_location`,
        # and content document results in `content_block_location`.
        sig do
          returns(
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaCitationCharLocation,
                  Anthropic::Models::Beta::BetaCitationPageLocation,
                  Anthropic::Models::Beta::BetaCitationContentBlockLocation
                )
              ]
            )
          )
        end
        attr_accessor :citations

        sig { returns(String) }
        attr_accessor :text

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            citations: T.nilable(
              T::Array[
                T.any(
                  Anthropic::Models::Beta::BetaCitationCharLocation,
                  Anthropic::Internal::AnyHash,
                  Anthropic::Models::Beta::BetaCitationPageLocation,
                  Anthropic::Models::Beta::BetaCitationContentBlockLocation
                )
              ]
            ),
            text: String,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(citations:, text:, type: :text); end

        sig do
          override
            .returns(
              {
                citations: T.nilable(
                  T::Array[
                    T.any(
                      Anthropic::Models::Beta::BetaCitationCharLocation,
                      Anthropic::Models::Beta::BetaCitationPageLocation,
                      Anthropic::Models::Beta::BetaCitationContentBlockLocation
                    )
                  ]
                ),
                text: String,
                type: Symbol
              }
            )
        end
        def to_hash; end
      end
    end

    BetaTextBlock = Beta::BetaTextBlock
  end
end
