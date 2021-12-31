class TenjiChar
  # 母音と濁音等の文字の対応表
  VOWELS = {
    "A": [0],
    "I": [0, 1],
    "U": [0, 3],
    "E": [0, 1, 3],
    "O": [1, 3],
    "N": [2, 4, 5],
    ":": [4], # 濁音
    ";": [5], # 半濁音
    "*": [3], # 拗音
    "_": [1], # 促音,
    "+": [3, 4], # 拗濁音
    "/": [3, 5] # 拗半濁音
  }.freeze

  # 子音の対応表
  CONSONANTS = {
    "K": [5],
    "S": [4, 5],
    "T": [2, 4],
    "N": [2],
    "H": [2, 5],
    "M": [2, 4, 5],
    "R": [4],
    "Y": [3],
    "W": [],
    "@": []
  }.freeze

  def initialize(char)
    @char = char
  end

  # oで埋めるべきインデックスの配列
  def tenji_array
    # 母音や「ん」のみの場合のために2文字にそろえる
    filled_char = @char.rjust(2, "@")
    # 子音のアルファベット
    consonant = filled_char[0]
    # 母音のアルファベット
    vowel = filled_char[1]

    vowel_idx = vowel(vowel, consonant)
    consonant_idx = consonant(consonant)
    raise ArgumentError, "Could not find the corresponding Tenji / 対応する点字を見つけることができませんでした" if vowel_idx.nil? || consonant_idx.nil?
    vowel_idx + consonant_idx
  end

  private

  # 母音の配列を返す
  def vowel(vowel, consonant)
    if ['Y', 'W'].include? consonant
      # や行とわ行は母音を最終行にずらす
      move_vowel_to_bottom(VOWELS[vowel.to_sym])
    else
      VOWELS[vowel.to_sym]
    end
  end

  # 子音の配列を返す
  def consonant(consonant)
    CONSONANTS[consonant.to_sym]
  end

  # 与えられた配列に対して全体を最終行にずらす
  def move_vowel_to_bottom(arr)
    bottom_index = arr.map {|x| x % 3 }.max
    arr.map { |n| (n + (2 - bottom_index)) }
  end
end
