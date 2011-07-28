require 'spec_helper'

describe "palindromes" do
  
  let(:performer) { Oulipo }
  
  it "detects palindromes" do
    performer.palindrome?('Mr. Owl ate my metal worm').should == true
    performer.palindrome?('Carelessness is a dish best served drunk').should == false
  end
  
end