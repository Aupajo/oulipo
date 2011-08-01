require 'spec_helper'
require 'oulipo/string_em_up'

describe "alliteration" do
  
  let(:pure_alliteration) { 'spec step succeeds speedily' }
  let(:mostly_alliterative) { 'quick queens quibble over quails' }
  
  it "detects pure alliteration" do
    pure_alliteration.should be_alliteration
  end

  it "tells us the alliterativity of a phrase" do
    pure_alliteration.alliterativity.should   == 1.0
    mostly_alliterative.alliterativity.should == 0.8
  end

  it "detects alliteration with a threshold" do
    mostly_alliterative.should_not be_alliteration
    mostly_alliterative.should be_alliteration(:threshold => 0.7)
    mostly_alliterative.should be_alliteration(:threshold => 0.8)
    mostly_alliterative.should_not be_alliteration(:threshold => 0.9)
  end
  
  it "is accessible via Oulipo" do
    Oulipo.should forward_to_enhanced_string(:alliterativity, :alliteration?)
  end
end