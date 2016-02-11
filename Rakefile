require 'bundler/gem_tasks'
require 'rake/extensiontask'
require 'rake/testtask'
require 'rake/clean'

if !defined?(JRUBY_VERSION) then
  Rake::ExtensionTask.new('xxtea') do |ext|
    ext.lib_dir = 'lib/xxtea'
  end
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end

desc "Run tests"
task :default => :test

Rake::Task[:test].prerequisites << :compile
