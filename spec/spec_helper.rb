require 'bundler'
Bundler.setup(:default, :test)

$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'oulipo'