# frozen_string_literal: true

source "https://rubygems.org"

gemspec

group :development do
  gem "rake"
  gem "rbs"
  gem "rubocop"
  gem "sorbet"
  gem "steep"
  gem "syntax_tree"
  # TODO: using a fork for now, the prettier below has a bug
  gem "syntax_tree-rbs", github: "stainless-api/syntax_tree-rbs", branch: "main"
  gem "tapioca"
end

group :development, :test do
  gem "minitest"
  gem "minitest-focus"
  gem "minitest-hooks"
  gem "minitest-proveit"
  gem "minitest-rg"
end

group :development, :docs do
  gem "webrick"
  gem "yard"
end

group :development, :test, :optional do
  gem "aws-sdk-bedrockruntime"
  gem "googleauth"
end
