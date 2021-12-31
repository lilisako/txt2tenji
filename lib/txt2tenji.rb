# frozen_string_literal: true

require_relative "txt2tenji/version"
require_relative "txt2tenji/tenji_builder"

module Txt2tenji
  class Error < StandardError; end

  module_function
  def generate_txt(text)
    TenjiBuilder.new(text).txt
  end
end
