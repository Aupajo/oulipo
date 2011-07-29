require 'spec_helper'

describe Oulipo::Proxiable do
  
  class Example
    include Oulipo::Proxiable
    attr_accessor :array
    proxy :array, :length, :each
  end
  
  let(:example) { Example.new }
  
  it "proxies length to the array" do
    example.array = %w{ one two three }
    example.array.length.should == 3
    example.length.should == 3
  end
  
  it "proxies each to the array" do
    example.array = %w{ one two three }
    
    result = []
    
    example.each do |item|
      result << item
    end
    
    result.should == %w{ one two three }
  end
  
end