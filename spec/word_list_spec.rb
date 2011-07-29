require 'spec_helper'

describe Oulipo::WordList do
  
  let(:word_list) { Oulipo::WordList.new }
  
  it "acts like an array" do
    word_list.length.should == 0
    word_list.index('apple').should be_nil
    word_list[0].should == nil
    
    word_list.push('apple')
    
    word_list.length.should == 1
    word_list.index('apple').should == 0
    word_list[0].should == 'apple'
  end
  
  it "loads from a file name" do
    list = Oulipo::WordList.load(File.dirname(__FILE__) + '/fixtures/word_list.txt')
    list.length.should == 3
    list.index('car').should == 1
    list[2].should == 'dog'
  end
  
  it "loads from a file" do
    file = File.open(File.dirname(__FILE__) + '/fixtures/word_list.txt')
    list = Oulipo::WordList.load(file)
    list.length.should == 3
    list.index('car').should == 1
    list[2].should == 'dog'
  end
  
end