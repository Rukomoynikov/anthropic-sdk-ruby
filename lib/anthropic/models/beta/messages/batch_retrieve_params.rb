# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchRetrieveParams < Anthropic::BaseModel
          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent8>]
          optional :betas, Anthropic::ArrayOf.new(Anthropic::Unknown), api_name: :"anthropic-beta"
        end
      end
    end
  end
end
