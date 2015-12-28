require "bundler"
require "bundler/setup"
Bundler::GemHelper.install_tasks

require "rake/testtask"

Rake::TestTask.new(:spec) do |t|
  t.libs << "lib"
  t.libs << "test"
  # t.verbose = true
  t.ruby_opts = %w[-rubygems]

  t.test_files = FileList["test/**/*_test.rb"]
    .exclude('test/benchmark_test.rb')
end

Rake::TestTask.new('spec:benchmark') do |t|
  t.libs << 'test'
  t.test_files = FileList.new 'test/benchmark_test.rb'
end

desc "Run specs against all gemfiles"
task "spec:all" do
  %w[
    Gemfile
    gemfiles/rails3.gemfile
  ].each do |gemfile|
    puts "=> Running with Gemfile: #{gemfile}"
    system "BUNDLE_GEMFILE=#{gemfile} rake spec"
  end
end

task :default => "spec"
