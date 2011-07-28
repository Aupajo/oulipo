require 'spec_helper'

describe "chaterisms" do
  
  # For easy switching
  let(:performer) { Oulipo }
  
  let(:snowball_poem) do
    <<-POEM
      The
      Dark
      Sings
      Softly
    POEM
  end
  
  let(:diminishing_poem) do
    <<-POEM
      Light's
      Songs
      Need
      Not
    POEM
  end
  
  let(:regular_poem) {
    <<-POEM
      Yet if hope has flown away
      In a night, or in a day,
      In a vision, or in none,
      Is it therefore the less gone?
    POEM
  }
  
  it "can detect both diminishing and growing chaterisms" do
    performer.chaterism?(snowball_poem).should == true
    performer.chaterism?(diminishing_poem).should == true
    performer.chaterism?(regular_poem).should == false
  end
  
  it "detects a snowball poem" do
    performer.snowball?(snowball_poem).should == true
    performer.snowball?(diminishing_poem).should == false
    performer.snowball?(regular_poem).should == false
  end
  
end