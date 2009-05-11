require File.join(File.dirname(__FILE__), '../../lib', 'basic')

require 'test/unit/assertions'
World(Test::Unit::Assertions)

Given /^a program$/ do |source|
  @output = StringIO.new
  @source = source
  
  PrintNode.output = @output
  @parser = LanguageParser.new
end

Then /^the program should parse$/ do
  result = @parser.parse(@source)
  result.eval({})
  unless result
    puts 'ERROR:'
    puts @parser.terminal_failures.join("\n")
  end
  assert result
end

Then /^the output is '(.*)'$/ do |output|
  assert_equal output, @output.string
end
