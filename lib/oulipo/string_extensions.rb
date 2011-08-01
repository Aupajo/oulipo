module Oulipo
  module StringExtensions
    ALPHABET = 'a'..'z'
    VOWELS = %w{ a e i o u }
    
    # Whether the string uses alliteration or not.
    # Accepts a :threshold option for determining whether the string
    # uses sufficient alliteration (see #aliterativity)
    def alliteration?(options = {})
      threshold = options.delete(:threshold) || 1
      self.alliterativity >= threshold
    end
    
    # A score between 0 and 1 representing the level of alliteration
    def alliterativity
      words = self.downcase.gsub(/[^a-z\s]/, '').split
      leading_letters = words.map(&:chr)
      
      # { 'a' => 3, 'b' => 1, ... }
      leading_letter_counts = leading_letters.inject({}) do |result, letter|
        result[letter] ||= 0
        result[letter] += 1
        result
      end
      
      most_used_count = leading_letter_counts.max_by { |kv| kv.last }.pop
      most_used_count.to_f / words.length
    end
    
    # The same letters backwards as forwards
    def palindrome?
      letter_sequence = self.downcase.gsub(/[^a-z]/, '')
      letter_sequence.reverse == letter_sequence
    end
    
    # Replace the words in the word list with the word n places after it
    def n_plus(places, word_list)
      analysis = Analysis.new(self, :nouns => word_list)
      substitutor = Substitutor.new(analysis)
      substitutor.replace(:nouns).increment(places)
    end
    
    # Returns true if each word is one letter larger than the previous
    def snowball?
      words = self.split
      self.chaterism? && words.first.length < words.last.length
    end
    
    # Returns true if only one vowel is used
    def univocalism?
      present_letters = self.downcase.split('').uniq
      (VOWELS - present_letters).length == 4
    end
    
    # Returns true if the string is a sequence of words in each of which is one letter larger than the 
    # previous, or each word in the sequence is one letter less than the previous
    def chaterism?
      words = self.gsub(/[^a-z\s]/i, '').split

      # Find the direction we're traveling
      flen, llen = words.first.length, words.last.length
      direction = flen > llen ? :downto : :upto
      
      # Compare the pattern of word lengths against a range-turned-array of expected word lengths
      words.map(&:length) == flen.send(direction, llen).to_a
    end
    
    # Returns an array of letters that are absent
    def absent_letters
      present_letters = self.downcase.split('').uniq
      missing_letters = ALPHABET.to_a - present_letters
      missing_letters.empty? ? nil : missing_letters
    end
    
    # Returns true if all letters of the alphabet are used
    def pangram?
      self.absent_letters.nil?
    end
    
    # Returns true if not all of the letters of the alphabet are used
    def lipogram?
      !self.pangram?
    end
    
  end
end