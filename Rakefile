require 'rake'
require 'rspec/core/rake_task'
require 'rspec'

path = File.expand_path('../spec', __FILE__)
task :default

Dir.foreach(path) do |item|
  file = File.expand_path(File.join(File.dirname(__FILE__), 'spec', item))
  next if /spec.rb/.match(item).nil?
  RSpec::Core::Runner.run([file])
end
