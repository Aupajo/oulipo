require File.dirname(__FILE__) + '/spec_helper'

describe "lipograms and pangrams" do
  
  # Easy to switch class, if refactored
  let(:performer) { Oulipo }
  
  let(:pangram) { 'The quick brown fox jumps over a lazy god' }
  let(:lipogram) { 'The quick grey fox jumps over lazy gods' }
  
  it "shows absent letters" do
    performer.absent_letters(pangram).should == nil
    performer.absent_letters(lipogram).should == %w{ b n w }
  end
  
  it "can tell a pangram from a lipogram" do
    performer.lipogram?(lipogram).should == true
    performer.lipogram?(pangram).should == false
    
    performer.pangram?(pangram).should == true
    performer.pangram?(lipogram).should == false
  end
  
end