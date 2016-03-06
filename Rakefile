require 'bundler/setup'
require 'rake'
require 'rake/testtask'

Bundler.setup

Rake::TestTask.new do |t|
  t.libs << "test"
  t.libs << "lib"
  t.libs << "models"
  t.libs << "services"
  t.libs << "views"
  t.pattern = "spec/**/*_spec.rb"
  t.verbose = true
end

task default: :test
task test: :pre_test

task :pre_test do
  ENV["RACK_ENV"] = 'test'
end
