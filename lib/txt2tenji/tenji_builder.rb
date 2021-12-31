require_relative "tenji_char"

class TenjiBuilder
  def initialize(text)
    @text = text
    @arrs = translatable_text.split(" ").map do |char|
      TenjiChar.new(char).tenji_array
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
      .gsub("CHI", "TI") # 表記を揃える
      .gsub(/(.)\1+/){ |s| "_ " + s[1..] } # 促音
      .gsub("G", ": K").gsub("Z", ": S").gsub("D", ": T").gsub("B", ": H") # 濁音
      .gsub("P", "; H") # 半濁音
      .gsub("SH", "* S").gsub("KY", "* K").gsub("CH", "* T") # 拗音
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
