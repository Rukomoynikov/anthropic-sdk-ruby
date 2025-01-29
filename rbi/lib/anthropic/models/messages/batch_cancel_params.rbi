# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchCancelParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        Shape = T.type_alias { T.all({}, Anthropic::RequestParameters::Shape) }

        sig { params(request_options: Anthropic::RequestOpts).void }
        def initialize(request_options: {}); end

        sig { returns(Anthropic::Models::Messages::BatchCancelParams::Shape) }
        def to_h; end
      end
    end
  end
end
