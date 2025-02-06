# typed: strong

module Anthropic
  module Models
    BetaCitationCharLocationParam = T.type_alias { Beta::BetaCitationCharLocationParam }

    module Beta
      class BetaCitationCharLocationParam < Anthropic::BaseModel
        sig { returns(String) }
        attr_accessor :cited_text

        sig { returns(Integer) }
        attr_accessor :document_index

        sig { returns(T.nilable(String)) }
        attr_accessor :document_title

        sig { returns(Integer) }
        attr_accessor :end_char_index

        sig { returns(Integer) }
        attr_accessor :start_char_index

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            cited_text: String,
            document_index: Integer,
            document_title: T.nilable(String),
            end_char_index: Integer,
            start_char_index: Integer,
            type: Symbol
          ).void
        end
        def initialize(
          cited_text:,
          document_index:,
          document_title:,
          end_char_index:,
          start_char_index:,
          type: :char_location
        )
        end

        sig do
          override.returns(
            {
              cited_text: String,
              document_index: Integer,
              document_title: T.nilable(String),
              end_char_index: Integer,
              start_char_index: Integer,
              type: Symbol
            }
          )
        end
        def to_hash; end
      end
    end
  end
end
