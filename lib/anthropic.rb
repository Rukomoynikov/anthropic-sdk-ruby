# frozen_string_literal: true

# Standard libraries.
require "cgi"
require "date"
require "json"
require "net/http"
require "securerandom"
require "set"
require "time"
require "uri"

# Gems.
require "connection_pool"

# Package files.
require_relative "anthropic/base_client"
require_relative "anthropic/base_model"
require_relative "anthropic/base_page"
require_relative "anthropic/errors"
require_relative "anthropic/request_options"
require_relative "anthropic/pooled_net_requester"
require_relative "anthropic/util"
require_relative "anthropic/version"
require_relative "anthropic/models/completion"
require_relative "anthropic/models/content_block"
require_relative "anthropic/models/content_block_param"
require_relative "anthropic/models/image_block_param"
require_relative "anthropic/models/input_json_delta"
require_relative "anthropic/models/message"
require_relative "anthropic/models/message_delta_usage"
require_relative "anthropic/models/message_param"
require_relative "anthropic/models/metadata"
require_relative "anthropic/models/model"
require_relative "anthropic/models/raw_content_block_delta_event"
require_relative "anthropic/models/raw_content_block_start_event"
require_relative "anthropic/models/raw_content_block_stop_event"
require_relative "anthropic/models/raw_message_delta_event"
require_relative "anthropic/models/raw_message_start_event"
require_relative "anthropic/models/raw_message_stop_event"
require_relative "anthropic/models/raw_message_stream_event"
require_relative "anthropic/models/text_block"
require_relative "anthropic/models/text_block_param"
require_relative "anthropic/models/text_delta"
require_relative "anthropic/models/tool"
require_relative "anthropic/models/tool_choice"
require_relative "anthropic/models/tool_choice_any"
require_relative "anthropic/models/tool_choice_auto"
require_relative "anthropic/models/tool_choice_tool"
require_relative "anthropic/models/tool_result_block_param"
require_relative "anthropic/models/tool_use_block"
require_relative "anthropic/models/tool_use_block_param"
require_relative "anthropic/models/usage"
require_relative "anthropic/models/anthropic_beta"
require_relative "anthropic/models/beta_api_error"
require_relative "anthropic/models/beta_authentication_error"
require_relative "anthropic/models/beta_error"
require_relative "anthropic/models/beta_error_response"
require_relative "anthropic/models/beta_invalid_request_error"
require_relative "anthropic/models/beta_not_found_error"
require_relative "anthropic/models/beta_overloaded_error"
require_relative "anthropic/models/beta_permission_error"
require_relative "anthropic/models/beta_rate_limit_error"
require_relative "anthropic/models/beta/beta_base64_pdf_block"
require_relative "anthropic/models/beta/beta_base64_pdf_source"
require_relative "anthropic/models/beta/beta_cache_control_ephemeral"
require_relative "anthropic/models/beta/beta_content_block"
require_relative "anthropic/models/beta/beta_content_block_param"
require_relative "anthropic/models/beta/beta_image_block_param"
require_relative "anthropic/models/beta/beta_input_json_delta"
require_relative "anthropic/models/beta/beta_message"
require_relative "anthropic/models/beta/beta_message_delta_usage"
require_relative "anthropic/models/beta/beta_message_param"
require_relative "anthropic/models/beta/beta_message_tokens_count"
require_relative "anthropic/models/beta/beta_metadata"
require_relative "anthropic/models/beta/beta_raw_content_block_delta_event"
require_relative "anthropic/models/beta/beta_raw_content_block_start_event"
require_relative "anthropic/models/beta/beta_raw_content_block_stop_event"
require_relative "anthropic/models/beta/beta_raw_message_delta_event"
require_relative "anthropic/models/beta/beta_raw_message_start_event"
require_relative "anthropic/models/beta/beta_raw_message_stop_event"
require_relative "anthropic/models/beta/beta_raw_message_stream_event"
require_relative "anthropic/models/beta/beta_text_block"
require_relative "anthropic/models/beta/beta_text_block_param"
require_relative "anthropic/models/beta/beta_text_delta"
require_relative "anthropic/models/beta/beta_tool"
require_relative "anthropic/models/beta/beta_tool_bash_20241022"
require_relative "anthropic/models/beta/beta_tool_choice"
require_relative "anthropic/models/beta/beta_tool_choice_any"
require_relative "anthropic/models/beta/beta_tool_choice_auto"
require_relative "anthropic/models/beta/beta_tool_choice_tool"
require_relative "anthropic/models/beta/beta_tool_computer_use_20241022"
require_relative "anthropic/models/beta/beta_tool_result_block_param"
require_relative "anthropic/models/beta/beta_tool_text_editor_20241022"
require_relative "anthropic/models/beta/beta_tool_union"
require_relative "anthropic/models/beta/beta_tool_use_block"
require_relative "anthropic/models/beta/beta_tool_use_block_param"
require_relative "anthropic/models/beta/beta_usage"
require_relative "anthropic/models/beta/messages/beta_message_batch"
require_relative "anthropic/models/beta/messages/beta_message_batch_canceled_result"
require_relative "anthropic/models/beta/messages/beta_message_batch_errored_result"
require_relative "anthropic/models/beta/messages/beta_message_batch_expired_result"
require_relative "anthropic/models/beta/messages/beta_message_batch_individual_response"
require_relative "anthropic/models/beta/messages/beta_message_batch_request_counts"
require_relative "anthropic/models/beta/messages/beta_message_batch_result"
require_relative "anthropic/models/beta/messages/beta_message_batch_succeeded_result"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_cache_control_ephemeral"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_image_block_param"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_message"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_message_param"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_text_block_param"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_tool"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_tool_result_block_param"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_tool_use_block_param"
require_relative "anthropic/models/beta/prompt_caching/prompt_caching_beta_usage"
require_relative "anthropic/models/beta/prompt_caching/raw_prompt_caching_beta_message_start_event"
require_relative "anthropic/models/beta/prompt_caching/raw_prompt_caching_beta_message_stream_event"
require_relative "anthropic/models/completion_create_params"
require_relative "anthropic/models/message_create_params"
require_relative "anthropic/models/beta/message_create_params"
require_relative "anthropic/models/beta/message_count_tokens_params"
require_relative "anthropic/models/beta/messages/batch_create_params"
require_relative "anthropic/models/beta/messages/batch_retrieve_params"
require_relative "anthropic/models/beta/messages/batch_list_params"
require_relative "anthropic/models/beta/messages/batch_cancel_params"
require_relative "anthropic/models/beta/messages/batch_results_params"
require_relative "anthropic/models/beta/prompt_caching/message_create_params"
require_relative "anthropic/page"
require_relative "anthropic/resources/completions"
require_relative "anthropic/resources/messages"
require_relative "anthropic/resources/beta"
require_relative "anthropic/resources/beta/messages"
require_relative "anthropic/resources/beta/messages/batches"
require_relative "anthropic/resources/beta/prompt_caching"
require_relative "anthropic/resources/beta/prompt_caching/messages"
require_relative "anthropic/client"
