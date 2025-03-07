# typed: strong

module Anthropic
  module Models
    class Model < Anthropic::Union
      abstract!

      class UnionMember0 < Anthropic::Enum
        abstract!

        # Our most intelligent model
        CLAUDE_3_7_SONNET_LATEST = :"claude-3-7-sonnet-latest"

        # Our most intelligent model
        CLAUDE_3_7_SONNET_20250219 = :"claude-3-7-sonnet-20250219"

        # Fastest and most compact model for near-instant responsiveness
        CLAUDE_3_5_HAIKU_LATEST = :"claude-3-5-haiku-latest"

        # Our fastest model
        CLAUDE_3_5_HAIKU_20241022 = :"claude-3-5-haiku-20241022"

        # Our previous most intelligent model
        CLAUDE_3_5_SONNET_LATEST = :"claude-3-5-sonnet-latest"

        # Our previous most intelligent model
        CLAUDE_3_5_SONNET_20241022 = :"claude-3-5-sonnet-20241022"

        CLAUDE_3_5_SONNET_20240620 = :"claude-3-5-sonnet-20240620"

        # Excels at writing and complex tasks
        CLAUDE_3_OPUS_LATEST = :"claude-3-opus-latest"

        # Excels at writing and complex tasks
        CLAUDE_3_OPUS_20240229 = :"claude-3-opus-20240229"

        # Balance of speed and intelligence
        CLAUDE_3_SONNET_20240229 = :"claude-3-sonnet-20240229"

        # Our previous most fast and cost-effective
        CLAUDE_3_HAIKU_20240307 = :"claude-3-haiku-20240307"

        CLAUDE_2_1 = :"claude-2.1"

        CLAUDE_2_0 = :"claude-2.0"

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end

      class << self
        sig { override.returns([[NilClass, Symbol], [NilClass, String]]) }
        private def variants
        end
      end
    end
  end
end
