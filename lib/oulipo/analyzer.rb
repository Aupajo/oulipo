module Oulipo
  class Analyzer
    attr_accessor :nouns
    
    def deconstruct(text)
      [text] unless nouns
      
      analysis = []
      
      text.split(/\b/).each do |chunk|
        result = analysis_for(chunk)
        
        if result.is_a?(String) && analysis.last.is_a?(String)
          analysis.last << result
        else
          analysis << result
        end
      end
      
      analysis
    end
    
    def reconstruct(deconstruction)
      deconstruction.map do |chunk|
        chunk.is_a?(Array) ? chunk.first : chunk
      end.join
    end
    
    private
    
    def analysis_for(text_chunk)
      if is_noun?(text_chunk)
        return [text_chunk, :noun]
      end
      
      text_chunk
    end
    
    def is_noun?(word)
      !noun_index_for(word).nil?
    end
    
    def noun_index_for(word)
      (nouns && nouns.index(word)) or nil
    end
  end
end 