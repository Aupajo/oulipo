require 'spec_helper'
require 'oulipo/string_em_up'

describe "univocalisms" do
  
  let(:univocalism) {
    <<-POEM
      No cool monsoons blow soft on Oxford dons,
      Orthodox, jog-trot, book-worm Solomons
    POEM
  }
  
  let (:regular_poem) {
    <<-POEM
      And fortune, on his damned quarrel smiling,
      Showed like a rebel's whore
      But all's too weak, for brave Macbeth --
      Well he deserves that name --
      Disdaining fortune, with his brandished steel,
      Which smoked with bloody execution
    POEM
  }
  
  it "detects a univocalism" do
    Oulipo.univocalism?(univocalism).should == true
    Oulipo.univocalism?(regular_poem).should == false
    
    univocalism.should be_univocalism
    regular_poem.should_not be_univocalism
  end
  
end