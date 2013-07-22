require "bundler/gem_tasks"

task :default => [:test]
task :test do
  $LOAD_PATH.unshift "lib", "spec"
  Dir.glob("./spec/**/*_spec.rb") { |f| require f }
end
