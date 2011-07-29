module Oulipo
  class Substitutor
    
    def initialize(analysis)
      @analysis = analysis
    end
    
    def replace(type)
      @type = type
      self
    end
    
    def increment(num)
      raise 'Increment must be called in conjunction with replace' if !@type
      
      result = ''
      
      @analysis.deconstruction.each do |segment|
        if segment.is_a?(Array) # tuple found
          if segment.last == @type # ready to replace
            result << find_successor(segment.first, num)
          else
            result << segment.first
          end
        else
          result << segment
        end
      end
      
      result
    end
    
    private
    
    def word_list
      @analysis.word_lists[@type]
    end
    
    def find_successor(word, num)
      # Find the current index and the limit
      current_index = word_list.index(word.downcase)
      limit = word_list.length
      
      # Calculate the successor's index, wrapping if we need to
      successor = (current_index + num) % limit
      
      word_list[successor]
    end
    
  end
end