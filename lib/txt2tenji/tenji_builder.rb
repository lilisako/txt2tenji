require_relative "tenji_char"

class TenjiBuilder
  def initialize(text)
    @arrs = []
    text = text.gsub("G", "G K")
    text = text.gsub("SH", "Y S")
    text.split(" ").each do |char|
      @arrs << TenjiChar.new(char).tenji_array.flatten(1)
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

  # 与えられたインデックスに対してoか-で返す
  def mark(arr, index)
    if arr.include? index
      "●"
    else
      "-"
    end
  end
end