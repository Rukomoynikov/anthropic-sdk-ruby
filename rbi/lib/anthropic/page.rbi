# typed: strong

module Anthropic
  class Page
    include Anthropic::BasePage

    Elem = type_member

    sig { returns(T::Array[Elem]) }
    def data
    end

    sig { params(_: T::Array[Elem]).returns(T::Array[Elem]) }
    def data=(_)
    end

    sig { returns(T::Boolean) }
    def has_more
    end

    sig { params(_: T::Boolean).returns(T::Boolean) }
    def has_more=(_)
    end

    sig { returns(T.nilable(String)) }
    def first_id
    end

    sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
    def first_id=(_)
    end

    sig { returns(T.nilable(String)) }
    def last_id
    end

    sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
    def last_id=(_)
    end

    sig do
      params(
        client: Anthropic::BaseClient,
        req: Anthropic::BaseClient::RequestComponentsShape,
        headers: T.any(T::Hash[String, String], Net::HTTPHeader),
        page_data: T::Hash[Symbol, T.anything]
      )
        .returns(T.attached_class)
    end
    def self.new(client:, req:, headers:, page_data:)
    end
  end
end
