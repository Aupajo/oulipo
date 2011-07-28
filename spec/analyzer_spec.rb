require 'spec_helper'

describe Oulipo::Analyzer do
  
  let(:analyzer) { Oulipo::Analyzer.new }
  
  describe "#deconstruct" do
    it "wraps the string in an array when given no cues" do
      analyzer.deconstruct('A man walked his dog').should == ['A man walked his dog']
    end
    
    it "creates a noun tuple when given nouns" do
      analyzer.nouns = %w{ apple cat dog man waffles }
      
      phrase = 'A man walked his dog'
      deconstruction = ['A ', ['man', :noun], ' walked his ', ['dog', :noun]]
      
      analyzer.deconstruct(phrase).should == deconstruction
    end
    
    it "preserves whitespace" do
      analyzer.nouns = %w{ apple cat dog man waffles }
      
      phrase = <<PHRASE
A man,
Walking his dog
PHRASE

      deconstruction = ['A ', ['man', :noun], ",\nWalking his ", ['dog', :noun]]
      
      analyzer.deconstruct(phrase.strip).should == deconstruction
    end
  end
  
  describe "#reconstruct" do    
    it "can reconstruct a deconstruction" do
      deconstruction = ['A ', ['man', :noun], ' walked his ', ['dog', :noun]]
      analyzer.reconstruct(deconstruction).should == 'A man walked his dog'
    end
    
    it "preserves whitespace" do
      story = <<STORYTIME
A man, walking his dog
Came across a fork in the road.
"What ho!" he said, picking it up.
STORYTIME

      deconstruction = [
        'A ', ['man', :noun], ", walking his ", ['dog', :noun],
        "\nCame across a fork in the road.\n\"",
        ['What', :interrogative], ' ', ['ho', :slur],
        "!\" he said, picking it up."
      ]
      
      analyzer.reconstruct(deconstruction).should == story.strip
    end
  end
end
