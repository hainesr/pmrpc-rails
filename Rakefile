#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

def version
  /^\ \*\ pmrpc\ (.+)\ -/.match(File.read("pmrpc/pmrpc.js"))[1]
end

task :submodule do
  sh "git submodule update --init" unless File.exist?("pmrpc/README.markdown")
end

desc "Remove the vendor directory"
task :clean do
  rm_rf "vendor"
end

desc "Install the pmrpc.js library"
task :pmrpc => :submodule do
  Rake.rake_output_message "Copying pmrpc.js"

  source = "pmrpc/pmrpc.js"
  destination = "vendor/assets/javascript"
  mkdir_p destination

  FileUtils.cp(source, destination)
end

desc "Update Pmrpc::Rails::PMRPC_VERSION"
task :version => :submodule do
  Rake.rake_output_message "Seting Pmrpc::Rails::PMRPC_VERSION = \"#{version}\""

  version_file = "lib/pmrpc/rails/version.rb"
  version_source = File.read(version_file)
  new_version = "PMRPC_VERSION = \"#{version}\""
  version_source.sub!(/PMRPC_VERSION = "[^"]*"/, new_version)
  File.write(version_file, version_source)
end

desc "Clean and then generate everything"
task :build => [:clean, :pmrpc, :version]

task :default => :test
