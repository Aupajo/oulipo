require 'oulipo/word_list'
require 'oulipo/string_extensions'
require 'oulipo/enhanced_string'
require 'oulipo/analysis'
require 'oulipo/substitutor'

module Oulipo
  
  [:absent_letters, :pangram?, :lipogram?, :chaterism?,
   :univocalism?, :snowball?, :palindrome?, :alliteration?,
   :alliterativity].each do |method|
      define_singleton_method(method.to_sym) do |*args|
        EnhancedString.new(args.shift).send(method.to_sym, *args)
      end
  end
  
  # Replace the word nth places ahead in the word_list
  def self.n_plus(places, text, word_list)
    EnhancedString.new(text).n_plus(places, word_list)
  end
end