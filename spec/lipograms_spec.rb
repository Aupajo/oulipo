require 'spec_helper'
require 'oulipo/string_em_up'

describe "lipograms and pangrams" do
  
  let(:pangram) { 'The quick brown fox jumps over a lazy god' }
  let(:lipogram) { 'The quick grey fox jumps over lazy gods' }
  let(:prisoner) { "rain's music runs in rivers" }
  let(:bradley_manning) { 'bradley e. manning' }
  
  it "shows absent letters" do
    pangram.absent_letters.should be_nil
    lipogram.absent_letters.should == %w{ b n w }
  end
  
  it "shows present letters" do
    pangram.present_letters.should == ('a'..'z').to_a
    lipogram.present_letters.should == ('a'..'z').to_a - %w{ b n w }
  end
  
  it "can tell a pangram from a lipogram" do
    lipogram.should be_lipogram
    pangram.should_not be_lipogram
    
    lipogram.should_not be_pangram
    pangram.should be_pangram
  end
  
  it "can tell a prisoner's constraint" do
    prisoner.should be_prisoner
    lipogram.should_not be_prisoner
    pangram.should_not be_prisoner
    bradley_manning.should_not be_prisoner
  end
  
  it "is accessible via Oulipo" do
    Oulipo.should forward_to_enhanced_string(:absent_letters, :present_letters,
                                             :lipogram?, :pangram?, :prisoner?)
  end
  
end