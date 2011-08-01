require 'spec_helper'
require 'oulipo/string_em_up'

describe "lipograms and pangrams" do
  
  let(:pangram) { 'The quick brown fox jumps over a lazy god' }
  let(:lipogram) { 'The quick grey fox jumps over lazy gods' }
  
  it "shows absent letters" do
    pangram.absent_letters.should be_nil
    lipogram.absent_letters.should == %w{ b n w }
  end
  
  it "can tell a pangram from a lipogram" do
    lipogram.should be_lipogram
    pangram.should_not be_lipogram
    
    lipogram.should_not be_pangram
    pangram.should be_pangram
  end
  
  it "is accessible via Oulipo" do
    Oulipo.should forward_to_enhanced_string(:lipogram?, :pangram?)
  end
  
end