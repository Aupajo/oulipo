require 'bundler'
Bundler.setup(:default, :test)

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'oulipo'

RSpec::Matchers.define :forward_to_enhanced_string do |*forwarded_methods|
  match do |oulipo|
    stubs = forwarded_methods.inject({}) { |stubs, method| stubs.merge(method => :forwarded) }
    enhanced_string = mock(:enhanced_string, stubs)
    Oulipo::EnhancedString.should_receive(:new).with('a phrase').at_least(:once).and_return(enhanced_string)
    
    forwarded_methods.each do |method|
      oulipo.send(method, 'a phrase').should == :forwarded
    end
  end
end