require 'spec_helper'

describe "palindromes" do
  
  it "detects palindromes" do
    Oulipo.palindrome?('Mr. Owl ate my metal worm').should == true
    Oulipo.palindrome?('Carelessness is a dish best served drunk').should == false
  end
  
end