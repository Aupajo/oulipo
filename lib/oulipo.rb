require 'oulipo/proxiable'
require 'oulipo/word_list'
require 'oulipo/analysis'
require 'oulipo/substitutor'

module Oulipo
  ALPHABET = 'a'..'z'
  VOWELS = %w{ a e i o u }
  
  def self.absent_letters(work)
    present_letters = work.downcase.split('').uniq
    missing_letters = ALPHABET.to_a - present_letters
    missing_letters.empty? ? nil : missing_letters
  end
  
  # A pangram uses all letters
  def self.pangram?(work)
    self.absent_letters(work).nil?
  end
  
  # A lipogram has missing letters
  def self.lipogram?(work)
    !self.pangram?(work)
  end
  
  # In a chaterism, each successive word is larger than the last or vice versa
  def self.chaterism?(poem)
    # Discard the punctuation, split into words
    words = poem.gsub(/[^a-z\s]/i, '').split
    
    # Find the direction we're traveling
    flen, llen = words.first.length, words.last.length
    direction = flen > llen ? :downto : :upto
    
    # "The tree sings".map(&:length) # => [3, 4, 5] 
    # [3, 4, 5] == 3.upto(5).to_a # => true
    words.map(&:length) == flen.send(direction, llen).to_a
  end
  
  def self.univocalism?(poem)
    present_letters = poem.downcase.split('').uniq
    (VOWELS - present_letters).length == 4
  end
  
  def self.snowball?(poem)
    words = poem.split
    self.chaterism?(poem) && words.first.length < words.last.length
  end
  
  def self.palindrome?(phrase)
    sequence = phrase.downcase.gsub(/[^a-z]/, '')
    sequence.reverse == sequence
  end
  
  def self.alliteration?(phrase, options = {})
    threshold = options.delete(:threshold) || 1
    self.alliterativity(phrase) >= threshold
  end
  
  # Calculate an alliteration score
  def self.alliterativity(phrase)
    words = phrase.downcase.gsub(/[^a-z\s]/, '').split
    leading_letters = words.map(&:chr)
    
    leading_letter_counts = leading_letters.inject({}) do |result, letter|
      result[letter] ||= 0
      result[letter] += 1
      result
    end
    
    most_used_count = leading_letter_counts.max_by { |kv| kv.last }.pop
    most_used_count.to_f / words.length
  end
  
  def self.substitute_nouns(places, text, word_list)
    
  end
end