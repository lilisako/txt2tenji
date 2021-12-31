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
      .gsub("GY", "+ K").gsub("J", "+ S").gsub("DY", "+ T").gsub("BY", "+ H") # 拗濁音
      .gsub("PY", "/ H") # 拗半濁音
      .gsub(/(.)\1+/){ |s| "_ " + s[1..] } # 促音
      .gsub("G", ": K").gsub("Z", ": S").gsub("D", ": T").gsub("B", ": H") # 濁音
      .gsub("P", "; H") # 半濁音
      .gsub("SH", "* S").gsub("KY", "* K").gsub("CH", "* T").gsub("NY", "* N")
      .gsub("HY", "* H").gsub("MY", "* M").gsub("RY", "* R") # 拗音
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
