require 'spec_helper'

describe "substitution" do
  
  let(:performer) { Oulipo }
  
  let(:phrase) { 'The bear ate the badger' }
  let(:noun_list) { %w{ badger bat bear } }
  
  let(:analysis) { Oulipo::Analysis.new(phrase, :nouns => noun_list) }
  let(:substitutor) { Oulipo::Substitutor.new(analysis) }
  
  it "substitutes types" do
    substitutor.replace(:nouns).increment(1).should == 'The badger ate the bat'
    substitutor.replace(:nouns).increment(2).should == 'The bat ate the bear'
    substitutor.replace(:nouns).increment(6).should == 'The bear ate the badger'
  end
  
  it "raises an error if increment is called before replace" do
    lambda { substitutor.increment(3) }.should raise_error
  end
  
  it "can be accessed from Oulipo" do
    performer.n_plus(1, phrase, noun_list).should == 'The badger ate the bat'
  end
  
end