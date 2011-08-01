require 'spec_helper'

describe "palindromes" do
  
  it "detects palindromes" do
    'Mr. Owl ate my metal worm'.should be_palindrome
    'Carelessness is a dish best served drunk'.should_not be_palindrome
  end
  
  it "is accessible via Oulipo" do
    Oulipo.should forward_to_enhanced_string(:palindrome?)
  end
  
end