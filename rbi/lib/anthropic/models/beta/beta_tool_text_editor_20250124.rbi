# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaToolTextEditor20250124 < Anthropic::BaseModel
        # Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash))
          )
            .void
        end
        attr_writer :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)),
            name: Symbol,
            type: Symbol
          )
            .returns(T.attached_class)
        end
        def self.new(cache_control: nil, name: :str_replace_editor, type: :text_editor_20250124)
        end

        sig do
          override
            .returns(
              {name: Symbol, type: Symbol, cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)}
            )
        end
        def to_hash
        end
      end
    end

    BetaToolTextEditor20250124 = Beta::BetaToolTextEditor20250124
  end
end
