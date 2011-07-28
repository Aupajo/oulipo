require 'spec_helper'

describe "univocalisms" do
  
  let(:performer) { Oulipo }
  
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
    performer.univocalism?(univocalism).should == true
    performer.univocalism?(regular_poem).should == false
  end
  
end