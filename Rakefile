require 'rake/testtask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

Rake::TestTask.new do |t|
  # Add the 'test' folder to the list of lib directories
  t.libs << 'test'
end

# Call RSpec's built-in :spec task
desc "Run tests"
task :default => :spec
