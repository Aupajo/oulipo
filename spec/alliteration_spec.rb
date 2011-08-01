require 'spec_helper'

describe "alliteration" do
  
  let(:pure_alliteration) { 'spec step succeeds speedily' }
  let(:mostly_alliterative) { 'quick queens quibble over quails' }
  
  it "detects pure alliteration" do
    Oulipo.alliteration?(pure_alliteration).should == true
  end
  
  it "tells us the alliterativity of a phrase" do
    Oulipo.alliterativity(pure_alliteration).should   == 1.0
    Oulipo.alliterativity(mostly_alliterative).should == 0.8
  end
  
  it "detects alliteration with a threshold" do
    Oulipo.alliteration?(mostly_alliterative).should == false
    Oulipo.alliteration?(mostly_alliterative, :threshold => 0.7).should == true
    Oulipo.alliteration?(mostly_alliterative, :threshold => 0.8).should == true
    Oulipo.alliteration?(mostly_alliterative, :threshold => 0.9).should == false
  end
  
end