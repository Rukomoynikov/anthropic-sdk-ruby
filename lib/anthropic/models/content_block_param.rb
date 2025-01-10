# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # case content_block_param
    # in {type: "text", text: String, type: Anthropic::Models::TextBlockParam::Type, cache_control: Anthropic::Models::CacheControlEphemeral}
    #   # Anthropic::Models::TextBlockParam ...
    # in {type: "image", source: Anthropic::Models::ImageBlockParam::Source, type: Anthropic::Models::ImageBlockParam::Type, cache_control: Anthropic::Models::CacheControlEphemeral}
    #   # Anthropic::Models::ImageBlockParam ...
    # in {type: "tool_use", id: String, input: Anthropic::Unknown, name: String}
    #   # Anthropic::Models::ToolUseBlockParam ...
    # in {type: "tool_result", tool_use_id: String, type: Anthropic::Models::ToolResultBlockParam::Type, cache_control: Anthropic::Models::CacheControlEphemeral}
    #   # Anthropic::Models::ToolResultBlockParam ...
    # in {type: "document", source: Anthropic::Models::Base64PDFSource, type: Anthropic::Models::DocumentBlockParam::Type, cache_control: Anthropic::Models::CacheControlEphemeral}
    #   # Anthropic::Models::DocumentBlockParam ...
    # end
    # ```
    #
    # @example
    #
    # ```ruby
    # case content_block_param
    # in Anthropic::Models::TextBlockParam
    #   # ...
    # in Anthropic::Models::ImageBlockParam
    #   # ...
    # in Anthropic::Models::ToolUseBlockParam
    #   # ...
    # in Anthropic::Models::ToolResultBlockParam
    #   # ...
    # in Anthropic::Models::DocumentBlockParam
    #   # ...
    # end
    # ```
    class ContentBlockParam < Anthropic::Union
      discriminator :type

      variant :text, -> { Anthropic::Models::TextBlockParam }

      variant :image, -> { Anthropic::Models::ImageBlockParam }

      variant :tool_use, -> { Anthropic::Models::ToolUseBlockParam }

      variant :tool_result, -> { Anthropic::Models::ToolResultBlockParam }

      variant :document, -> { Anthropic::Models::DocumentBlockParam }
    end
  end
end
