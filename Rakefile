require 'cucumber/rake/task'
require 'rake/clean'

CLOBBER << FileList['*_parser.rb']

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = "--format pretty"
end

desc 'Generate Ruby from Treetop for sleuthing purposes.'
task :parsers do
  tt FileList['*.treetop']
end

def tt(files)
  files.each { |f| `tt #{f} -o #{File.basename(f, '.treetop')}_parser.rb` }
end