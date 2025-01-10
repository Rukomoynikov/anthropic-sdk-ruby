# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      #
      # ```ruby
      # beta_image_block_param => {
      #   source: Anthropic::Models::Beta::BetaImageBlockParam::Source,
      #   type: Anthropic::Models::Beta::BetaImageBlockParam::Type,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral
      # }
      # ```
      class BetaImageBlockParam < Anthropic::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaImageBlockParam::Source]
        required :source, -> { Anthropic::Models::Beta::BetaImageBlockParam::Source }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!parse
        #   # @param source [Anthropic::Models::Beta::BetaImageBlockParam::Source]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   #
        #   def initialize(source:, type:, cache_control: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # source => {
        #   data: String,
        #   media_type: Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType,
        #   type: Anthropic::Models::Beta::BetaImageBlockParam::Source::Type
        # }
        # ```
        class Source < Anthropic::BaseModel
          # @!attribute data
          #
          #   @return [String]
          required :data, String

          # @!attribute media_type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType]
          required :media_type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::MediaType }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaImageBlockParam::Source::Type]
          required :type, enum: -> { Anthropic::Models::Beta::BetaImageBlockParam::Source::Type }

          # @!parse
          #   # @param data [String]
          #   # @param media_type [String]
          #   # @param type [String]
          #   #
          #   def initialize(data:, media_type:, type:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          #
          # ```ruby
          # case media_type
          # in :"image/jpeg"
          #   # ...
          # in :"image/png"
          #   # ...
          # in :"image/gif"
          #   # ...
          # in :"image/webp"
          #   # ...
          # end
          # ```
          class MediaType < Anthropic::Enum
            IMAGE_JPEG = :"image/jpeg"
            IMAGE_PNG = :"image/png"
            IMAGE_GIF = :"image/gif"
            IMAGE_WEBP = :"image/webp"

            finalize!
          end

          # @example
          #
          # ```ruby
          # case type
          # in :base64
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            BASE64 = :base64

            finalize!
          end
        end

        # @example
        #
        # ```ruby
        # case type
        # in :image
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          IMAGE = :image

          finalize!
        end
      end
    end

    BetaImageBlockParam = Beta::BetaImageBlockParam
  end
end
