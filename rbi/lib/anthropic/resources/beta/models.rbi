# typed: strong

module Anthropic
  module Resources
    class Beta
      class Models
        # Get a specific model.
        #
        #   The Models API response can be used to determine information about a specific
        #   model or resolve a model alias to a model ID.
        sig do
          params(
            model_id: String,
            request_options: T.nilable(T.any(Anthropic::RequestOptions, Anthropic::Util::AnyHash))
          )
            .returns(Anthropic::Models::Beta::BetaModelInfo)
        end
        def retrieve(
          # Model identifier or alias.
          model_id,
          request_options: {}
        )
        end

        # List available models.
        #
        #   The Models API response can be used to determine which models are available for
        #   use in the API. More recently released models are listed first.
        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            request_options: T.nilable(T.any(Anthropic::RequestOptions, Anthropic::Util::AnyHash))
          )
            .returns(Anthropic::Page[Anthropic::Models::Beta::BetaModelInfo])
        end
        def list(
          # ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately after this object.
          after_id: nil,
          # ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately before this object.
          before_id: nil,
          # Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          request_options: {}
        )
        end

        sig { params(client: Anthropic::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end
