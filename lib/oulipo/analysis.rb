module Oulipo
  class Analysis
    include Oulipo::Proxiable
    include Enumerable
    
    attr_reader :original, :deconstruction, :word_lists
  
    def initialize(text, options = {})
      @word_lists = options
      @original = text
      deconstruct!
    end
    
    def identified(type = nil)
      result = identified_tuples
      result.select! { |tuple| tuple.last == type } if type
      result.map(&:first)
    end
    
    private
    
    def is_tuple?(object)
      object.is_a?(Array)
    end
    
    def is_plain?(object)
      object.is_a?(String)
    end
    
    def identified_tuples
      deconstruction.select { |segment| is_tuple?(segment) }
    end
    
    def identify(wordish)
      return wordish if wordish.empty?
      
      word_lists.each do |type, list|
        return [wordish, type] if list.index(wordish.downcase)
      end
      
      wordish
    end
    
    def deconstruct!
      chunks = original.split(/\b/)
      
      @deconstruction = []
      
      chunks.each do |wordish|
        analysis = identify(wordish)
        
        if is_plain?(analysis) and is_plain?(deconstruction.last)
          deconstruction.last << analysis
        else
          deconstruction << analysis
        end
      end
    end
    
  end
end