task :parsers do
  tt FileList['*.treetop']
end

def tt(files)
  files.each { |f| `tt #{f} -o #{File.basename(f, '.treetop')}_parser.rb` }
end