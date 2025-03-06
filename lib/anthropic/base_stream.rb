# frozen_string_literal: true

module Anthropic
  # @private
  #
  class BaseStream
    # @private
    #
    # @param model [Class, Anthropic::Converter]
    # @param url [URI::Generic]
    # @param status [Integer]
    # @param response [Net::HTTPResponse]
    # @param messages [Enumerable]
    #
    def initialize(model:, url:, status:, response:, messages:)
      @model = model
      @url = url
      @status = status
      @response = response
      @messages = messages
      @iterator = iterator
    end

    # @private
    #
    # @return [Enumerable]
    #
    private def iterator = (raise NotImplementedError)

    # @return [void]
    #
    def close = Anthropic::Util.close_fused!(@iterator)

    # @param blk [Proc]
    #
    # @return [void]
    #
    def for_each(&)
      unless block_given?
        raise ArgumentError.new("A block must be given to #for_each")
      end
      @iterator.each(&)
    end

    # @return [Enumerable]
    #
    def to_enum = @iterator

    alias_method :enum_for, :to_enum
  end
end
