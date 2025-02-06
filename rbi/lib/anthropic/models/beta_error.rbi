# typed: strong

module Anthropic
  module Models
    class BetaError < Anthropic::Union
      abstract!

      sig do
        override.returns(
          [
            [Symbol, Anthropic::Models::BetaInvalidRequestError],
            [Symbol, Anthropic::Models::BetaAuthenticationError],
            [Symbol, Anthropic::Models::BetaBillingError],
            [Symbol, Anthropic::Models::BetaPermissionError],
            [Symbol, Anthropic::Models::BetaNotFoundError],
            [Symbol, Anthropic::Models::BetaRateLimitError],
            [Symbol, Anthropic::Models::BetaGatewayTimeoutError],
            [Symbol, Anthropic::Models::BetaAPIError],
            [Symbol, Anthropic::Models::BetaOverloadedError]
          ]
        )
      end
      private_class_method def self.variants; end
    end
  end
end
