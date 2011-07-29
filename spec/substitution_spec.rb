require 'spec_helper'

describe "substitution" do
  
  def analysis_with(phrase, options)
    Oulipo::Analysis.new(phrase, options)
  end
  
  def substitutor_with(*args)
    Oulipo::Substitutor.new analysis_with(*args)
  end
  
  let(:performer) { Oulipo }
  
  let(:phrase) { 'The bear ate the badger' }
  let(:noun_list) { %w{ badger bat bear } }
  let(:substitutor) { substitutor_with(phrase, :nouns => noun_list) }
  
  it "substitutes types" do
    substitutor.replace(:nouns).increment(1).should == 'The badger ate the bat'
    substitutor.replace(:nouns).increment(2).should == 'The bat ate the bear'
    substitutor.replace(:nouns).increment(6).should == 'The bear ate the badger'
  end
  
  it "raises an error if increment is called before replace" do
    lambda { substitutor.increment(3) }.should raise_error
  end
  
  it "can be accessed from Oulipo with n_plus" do
    performer.n_plus(1, phrase, noun_list).should == 'The badger ate the bat'
    performer.n_plus(2, phrase, noun_list).should == 'The bat ate the bear'
    performer.n_plus(6, phrase, noun_list).should == 'The bear ate the badger'
  end
  
  it "handles unused nouns" do
    nouns = %w{ badger bear bat ball balustrade }
    substitutor = substitutor_with(phrase, :nouns => nouns)
    substitutor.replace(:nouns).increment(4).should == 'The badger ate the balustrade'
  end
  
  it "matches case" do
    substitutor = substitutor_with('The BEAR ate the BadgeR', :nouns => noun_list)
    substitutor.replace(:nouns).increment(1).should == 'The badger ate the bat'
  end
  
end