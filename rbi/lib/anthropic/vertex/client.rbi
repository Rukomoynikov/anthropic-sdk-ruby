# typed: strong

module Anthropic
  module Vertex
    class Client < Anthropic::Client
      DEFAULT_VERSION = "vertex-2023-10-16"

      sig { returns(String) }
      def region
      end

      sig { returns(String) }
      def project_id
      end

      sig { returns(Anthropic::Resources::Messages) }
      def messages
      end

      sig { returns(Anthropic::Resources::Beta) }
      def beta
      end

      sig do
        override
          .params(req: Anthropic::BaseClient::RequestComponentsShape, opts: T::Hash[Symbol, T.anything])
          .returns(Anthropic::BaseClient::RequestInputShape)
      end
      private def build_request(req, opts)
      end

      sig do
        params(request_components: Anthropic::BaseClient::RequestComponentsShape)
          .returns(Anthropic::BaseClient::RequestComponentsShape)
      end
      private def fit_req_to_vertex_specs!(request_components) end

      sig do
        params(
          region: T.nilable(String),
          project_id: T.nilable(String),
          base_url: T.nilable(String),
          max_retries: Integer,
          timeout: Float,
          initial_retry_delay: Float,
          max_retry_delay: Float,
        ).void
      end
      def initialize(
        region: ENV["CLOUD_ML_REGION"],
        project_id: ENV["ANTHROPIC_VERTEX_PROJECT_ID"],
        base_url: nil,
        max_retries: DEFAULT_MAX_RETRIES,
        timeout: DEFAULT_TIMEOUT_IN_SECONDS,
        initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
        max_retry_delay: DEFAULT_MAX_RETRY_DELAY
      ) end
    end
  end
end
