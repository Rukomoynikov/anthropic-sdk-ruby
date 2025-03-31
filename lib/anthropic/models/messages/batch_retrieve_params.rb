# frozen_string_literal: true

module Anthropic
  module Models
    module Messages
      class BatchRetrieveParams < Anthropic::BaseModel
        # @!parse
        #   extend Anthropic::Type::RequestParameters::Converter
        include Anthropic::RequestParameters

        # @!parse
        #   # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        #   #
        #   def initialize(request_options: {}, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end
  end
end
