# typed: strong

module Anthropic
  module Models
    BetaContentBlockSourceContent = T.type_alias { Beta::BetaContentBlockSourceContent }

    module Beta
      class BetaContentBlockSourceContent < Anthropic::Union
        abstract!

        class << self
          # @api private
          sig do
            override
              .returns(
                [[Symbol, Anthropic::Models::Beta::BetaTextBlockParam], [Symbol, Anthropic::Models::Beta::BetaImageBlockParam]]
              )
          end
          private def variants
          end
        end
      end
    end
  end
end
