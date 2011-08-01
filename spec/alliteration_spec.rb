require 'spec_helper'
require 'oulipo/string_em_up'

describe "alliteration" do
  
  let(:pure_alliteration) { 'spec step succeeds speedily' }
  let(:mostly_alliterative) { 'quick queens quibble over quails' }
  
  it "detects pure alliteration" do
    Oulipo.alliteration?(pure_alliteration).should == true
    pure_alliteration.should be_alliteration
  end

  it "tells us the alliterativity of a phrase" do
    Oulipo.alliterativity(pure_alliteration).should   == 1.0
    Oulipo.alliterativity(mostly_alliterative).should == 0.8
    pure_alliteration.alliterativity.should   == 1.0
    mostly_alliterative.alliterativity.should == 0.8
  end

  it "detects alliteration with a threshold" do
    Oulipo.alliteration?(mostly_alliterative).should == false
    Oulipo.alliteration?(mostly_alliterative, :threshold => 0.7).should == true
    Oulipo.alliteration?(mostly_alliterative, :threshold => 0.8).should == true
    Oulipo.alliteration?(mostly_alliterative, :threshold => 0.9).should == false
    
    mostly_alliterative.should_not be_alliteration
    mostly_alliterative.should be_alliteration(:threshold => 0.7)
    mostly_alliterative.should be_alliteration(:threshold => 0.8)
    mostly_alliterative.should_not be_alliteration(:threshold => 0.9)
  end
end