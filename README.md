# Anthropic Ruby API library

The Anthropic Ruby library provides convenient access to the Anthropic REST API from any Ruby 3.0.0+
application.

## Documentation

Documentation for the most recent release of this gem can be found [on RubyDoc](https://gemdocs.org/gems/anthropic/latest).

The underlying REST API documentation can be found on [docs.anthropic.com](https://docs.anthropic.com/claude/reference/).

## Installation

To use this gem during the beta, install directly from GitHub with Bundler by
adding the following to your application's `Gemfile`:

```ruby
gem "anthropic", git: "https://github.com/stainless-sdks/anthropic-ruby", branch: "main"
```

To fetch an initial copy of the gem:

```sh
bundle install
```

To update the version used by your application when updates are pushed to
GitHub:

```sh
bundle update anthropic
```

## Usage

```ruby
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Client.new(
  api_key: "my-anthropic-api-key" # defaults to ENV["ANTHROPIC_API_KEY"]
)

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest"
)

puts(message.content)
```

### Errors

When the library is unable to connect to the API, or if the API returns a
non-success status code (i.e., 4xx or 5xx response), a subclass of
`Anthropic::Error` will be thrown:

```ruby
begin
  message = anthropic.messages.create(
    max_tokens: 1024,
    messages: [{
      role: "user",
      content: "Hello, Claude"
    }],
    model: "claude-3-5-sonnet-latest"
  )
rescue Anthropic::Error => e
  puts(e.status) # 400
end
```

Error codes are as followed:

| Cause            | Error Type                 |
| ---------------- | -------------------------- |
| HTTP 400         | `BadRequestError`          |
| HTTP 401         | `AuthenticationError`      |
| HTTP 403         | `PermissionDeniedError`    |
| HTTP 404         | `NotFoundError`            |
| HTTP 409         | `ConflictError`            |
| HTTP 422         | `UnprocessableEntityError` |
| HTTP 429         | `RateLimitError`           |
| HTTP >=500       | `InternalServerError`      |
| Other HTTP error | `APIStatusError`           |
| Timeout          | `APITimeoutError`          |
| Network error    | `APIConnectionError`       |

### Retries

Certain errors will be automatically retried 2 times by default, with a short
exponential backoff. Connection errors (for example, due to a network
connectivity problem), 408 Request Timeout, 409 Conflict, 429 Rate Limit, >=500 Internal errors,
and timeouts will all be retried by default.

You can use the `max_retries` option to configure or disable this:

```ruby
# Configure the default for all requests:
anthropic = Anthropic::Client.new(
  max_retries: 0 # default is 2
)

# Or, configure per-request:
anthropic.messages.create(
  max_tokens: 1024,
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest",
  request_options: {max_retries: 5}
)
```

### Timeouts

By default, requests will time out after 600 seconds.
Timeouts are applied separately to the initial connection and the overall request time,
so in some cases a request could wait 2\*timeout seconds before it fails.

You can use the `timeout` option to configure or disable this:

```ruby
# Configure the default for all requests:
anthropic = Anthropic::Client.new(
  timeout: nil # default is 600
)

# Or, configure per-request:
anthropic.messages.create(
  max_tokens: 1024,
  messages: [{
    role: "user",
    content: "Hello, Claude"
  }],
  model: "claude-3-5-sonnet-latest",
  request_options: {timeout: 5}
)
```

## AWS Bedrock

This library also provides support for the [Anthropic Bedrock API](https://aws.amazon.com/bedrock/claude/) if you install this library with the `aws-sdk-bedrockruntime` gem. 

You can then instantiate a separate `Anthropic::Bedrock::Client` class, and use AWS's standard guide for configuring credentials (see [the aws-sdk-ruby gem README](https://github.com/aws/aws-sdk-ruby?tab=readme-ov-file#configuration) or [AWS Documentation](https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/setup-config.html#credchain)).  It has the same API as the base `Anthropic::Client` class.


Note that the model ID required is different for Bedrock models, and, depending on the model you want to use, you will need to use either the AWS's model ID for Anthropic models -- which can be found in [AWS's Bedrock model catalog](https://docs.aws.amazon.com/bedrock/latest/userguide/models-supported.html) -- or an inference profile id (e.g. `us.anthropic.claude-3-5-haiku-20241022-v1:0` for Claude 3.5 Haiku).

```rb
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Bedrock::Client.new

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "anthropic.claude-3-5-sonnet-20241022-v2:0"
)

puts message
```

For more examples see [`examples/bedrock`](examples/bedrock).

## Google Vertex

This library also provides support for the [Anthropic Vertex API](https://cloud.google.com/vertex-ai?hl=en) if you install this library with the `googleauth` gem.

You can then import and instantiate a separate `Anthropic::Vertex::Client` class, and use Google's guide for configuring [Application Default Credentials](https://cloud.google.com/docs/authentication/provide-credentials-adc). It has the same API as the base `Anthropic::Client` class.

```rb
require "bundler/setup"
require "anthropic"

anthropic = Anthropic::Vertex::Client.new(region: "us-east5", project_id: "my-project-id")

message = anthropic.messages.create(
  max_tokens: 1024,
  messages: [
    {
      role: "user",
      content: "Hello, Claude"
    }
  ],
  model: "claude-3-7-sonnet@20250219"
)

puts message

```

For more examples see [`examples/vertex`](examples/vertex).

## Versioning

This package follows [SemVer](https://semver.org/spec/v2.0.0.html) conventions. As the
library is in initial development and has a major version of `0`, APIs may change
at any time.

## Requirements

Ruby 3.0 or higher.
