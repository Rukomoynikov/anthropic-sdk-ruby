# typed: strong

module Anthropic
  module Resources
    class Beta
      sig { returns(Anthropic::Resources::Beta::Models) }
      attr_reader :models

      sig { returns(Anthropic::Resources::Beta::Messages) }
      attr_reader :messages

      # @api private
      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
