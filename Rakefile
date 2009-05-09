task :parsers do
  tt FileList['*.treetop']
end

task :clean do
  rm FileList['*_parser.rb']
end

def tt(files)
  files.each { |f| `tt #{f} -o #{File.basename(f, '.treetop')}_parser.rb` }
end