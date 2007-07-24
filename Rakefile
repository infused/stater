require "rubygems"
require "hoe"
require "spec/rake/spectask"

Hoe.new("stater", "1.0.0") do |p|
  p.author = "Keith Morrison"
  p.test_globs = ["test/**/*_test.rb"]
end

desc "Run specs"
Spec::Rake::SpecTask.new :spec do |t|
  t.spec_files = FileList['spec/**/*spec.rb']
end

desc "Run spec docs"
Spec::Rake::SpecTask.new :specdoc do |t|
  t.spec_opts = ["-f specdoc"]
  t.spec_files = FileList['spec/**/*spec.rb']
end
