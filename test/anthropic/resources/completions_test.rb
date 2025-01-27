# frozen_string_literal: true

require_relative "../test_helper"

class Anthropic::Test::Resources::CompletionsTest < Minitest::Test
  def before_all
    @anthropic = Anthropic::Client.new(
      base_url: ENV.fetch("TEST_API_BASE_URL", "http://localhost:4010"),
      api_key: "my-anthropic-api-key"
    )
  end

  def test_create_required_params
    response = @anthropic.completions.create(
      max_tokens_to_sample: 256,
      model: "claude-3-5-haiku-latest",
      prompt: "\n\nHuman: Hello, world!\n\nAssistant:",
      stream: true
    )

    assert_pattern do
      response => Anthropic::Models::Completion
    end
  end
end
