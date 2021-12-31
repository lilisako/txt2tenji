require_relative "tenji_char"

class TenjiBuilder
  def initialize(text)
    @arrs = []
    @text = text

    translatable_text.split(" ").each do |char|
      @arrs << TenjiChar.new(char).tenji_array
    end
  end

  def txt
    3.times.map do |index|
      @arrs.map do |arr|
        "#{mark(arr, index)}#{mark(arr, index+3)}"
      end.join(" ")
    end.join("\n")
  end

  private

  def translatable_text
    @text
      .gsub("G", ": K").gsub("Z", ": S")
      .gsub("SH", "* S")
  end

  # 与えられたインデックスに対してoか-で返す
  def mark(arr, index)
    if arr.include? index
      "●"
    else
      "-"
    end
  end
end
