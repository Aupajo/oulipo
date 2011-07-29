module Oulipo
  class WordList
    def initialize
      @words = []
    end
    
    def self.load(file)
      dict = self.new
      file = File.open(file) if file.is_a?(String)
      
      file.each_line do |word|
        dict.push(word.strip)
      end
      
      dict
    end
    
    def index(word)
      @words.index(word)
    end
    
    def length
      @words.length
    end
    
    def [](index)
      @words[index]
    end
    
    def push(word)
      @words.push(word)
    end
  end
end