require 'spec_helper'
require 'oulipo/string_em_up'

describe "lipograms and pangrams" do
  
  let(:pangram) { 'The quick brown fox jumps over a lazy god' }
  let(:lipogram) { 'The quick grey fox jumps over lazy gods' }
  
  it "shows absent letters" do
    Oulipo.absent_letters(pangram).should == nil
    Oulipo.absent_letters(lipogram).should == %w{ b n w }
    
    pangram.absent_letters.should be_nil
    lipogram.absent_letters.should == %w{ b n w }
  end
  
  it "can tell a pangram from a lipogram" do
    Oulipo.lipogram?(lipogram).should == true
    Oulipo.lipogram?(pangram).should == false
    
    lipogram.should be_lipogram
    pangram.should_not be_lipogram
    
    Oulipo.pangram?(pangram).should == true
    Oulipo.pangram?(lipogram).should == false
    
    lipogram.should_not be_pangram
    pangram.should be_pangram
  end
  
end