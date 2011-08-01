require 'spec_helper'

describe Oulipo::Analysis do
  
  let(:folksong) { "O'er the moor and among the heather" }
  
  let(:word_lists) { { :nouns => %w{ moor heather },
                       :prepositions => %w{ among } } }
  
  let(:analysis) { Oulipo::Analysis.new(folksong, word_lists) }
  
  it "can identify words" do
    analysis.identified.sort.should == %w{ among heather moor }
    analysis.identified(:nouns).should == %w{ moor heather }
    analysis.identified(:prepositions).should == %w{ among }
  end
  
  it "can return the original string" do
    analysis.original.should == "O'er the moor and among the heather"
  end
  
  it "can return the raw deconstruction" do
    deconstruction = ["O'er the ", ['moor', :nouns], ' and ', ['among', :prepositions], ' the ', ['heather', :nouns]]
    analysis.deconstruction.should == deconstruction
  end
  
  it "can return the word lists it's using" do
    analysis.word_lists.should == word_lists
  end
  
end