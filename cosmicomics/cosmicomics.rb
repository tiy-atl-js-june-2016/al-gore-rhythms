require "json"
require "pry"

DICT_FILE = "/Users/brit/english-dict.json"

@comparisons = 0

def load_dictionary
  JSON.parse(File.read(DICT_FILE))
end

def load_organized_dict
  dict = Hash.new([])
  JSON.parse(File.read(DICT_FILE)).each do |word|
    if word.length > 3
      dict[word.length] += [word]
    end
  end
  dict
end

def weird_word?(word1, word2)
  anagram?(word1, word2) && has_joiner?(word1, word2)
end

def anagram?(word1, word2)
  word1.chars.sort.join == word2.chars.sort.join
end

def has_joiner?(word1, word2)
  word1[-1] == word2[0]
end

def word_check(word1, word2)
  if word1 != word2 && weird_word?(word1, word2)
    puts "#{word1}#{word2[1..-1]}"
  end
end

def main
  words = load_dictionary
  words.each do |word1|
    # puts @comparisons
    words.each do |word2|
      if word1.length == word2.length
        @comparisons += 1
        word_check(word1, word2)
      end
    end
  end
end

def fast_main
  dict = load_organized_dict
  combinations = dict.values.map { |x| x.length * x.length }.reduce(&:+)
  puts "\n\n\nTotal Combinations to check: #{combinations}\n\n\n"

  dict.each do |length, words|
    puts "\n\n Checking Words of size #{length}\n\n"
    words.each do |word1|
      words.each do |word2|
        word_check(word1, word2)
      end
    end
  end
end

fast_main

puts "#{@comparisons} comparisons"
