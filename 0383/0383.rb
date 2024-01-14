# frozen_string_literal: true

# map both strings
def can_construct(ransom_note, magazine)
  return false unless ransom_note.length <= magazine.length

  note_map = {}
  note_map.default = 0
  magazine_map = note_map.dup

  ransom_note.each_char do |char|
    note_map[char] += 1
  end

  magazine.each_char do |char|
    magazine_map[char] += 1
  end

  note_map.each do |key, val|
    return false unless magazine_map[key] >= val
  end

  true
end

# map one string. not very ruby like
def can_construct(ransom_note, magazine)
  return false unless ransom_note.length <= magazine.length

  char_map = Array.new(26, 0)

  magazine.each_char { char_map[_1.ord - 'a'.ord] += 1 }
  ransom_note.each_char do |char|
    return false if char_map[char.ord - 'a'.ord] == 0

    char_map[char.ord - 'a'.ord] -= 1
  end
  true
end

# Silly ruby one liner. Fastest implementation, but likely bc it offloads everything to C?
def can_construct(ransom_note, magazine)
  ransom_note.chars.uniq.all? { ransom_note.count(_1) <= magazine.count(_1) }
end

puts can_construct("bg", "efjbdfbdgfjhhaiigfhbaejahgfbbgbjagbddfgdiaigdadhcfcj")
