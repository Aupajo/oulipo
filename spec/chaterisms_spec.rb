require 'spec_helper'
require 'oulipo/string_em_up'

describe "chaterisms" do
  
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
    Oulipo.chaterism?(snowball_poem).should == true
    Oulipo.chaterism?(diminishing_poem).should == true
    Oulipo.chaterism?(regular_poem).should == false
    
    snowball_poem.should be_chaterism
    diminishing_poem.should be_chaterism
    regular_poem.should_not be_chaterism
  end
  
  it "detects a snowball poem" do
    Oulipo.snowball?(snowball_poem).should == true
    Oulipo.snowball?(diminishing_poem).should == false
    Oulipo.snowball?(regular_poem).should == false
    
    snowball_poem.should be_snowball
    diminishing_poem.should_not be_snowball
    regular_poem.should_not be_snowball
  end
  
end