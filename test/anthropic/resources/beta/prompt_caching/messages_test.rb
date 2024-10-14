# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::PromptCaching::MessagesTest < Minitest::Test
  parallelize_me!

  def setup
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.beta.prompt_caching.messages.create(
      {
        max_tokens: 1024,
        messages: [{"content" => "Hello, world", "role" => "user"}],
        model: "claude-3-5-sonnet-20240620"
      }
    )
    assert_kind_of(Anthropic::Models::PromptCachingBetaMessage, response)
  end
end
