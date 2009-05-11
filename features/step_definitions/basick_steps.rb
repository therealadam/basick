require File.join(File.dirname(__FILE__), '../../lib', 'basic')

require 'test/unit/assertions'
World(Test::Unit::Assertions)

Given /^a program$/ do |source|
  @output = StringIO.new
  @source = source
  
  PrintNode.output = @output
  @parser = LanguageParser.new
  @result = @parser.parse(@source)
  @env = @result.eval({})
end

Then /^the program should parse$/ do
  unless @result
    puts 'ERROR:'
    puts @parser.terminal_failures.join("\n")
  end
  assert @result
end

Then /^the output is '(.*)'$/ do |output|
  assert_equal output, @output.string
end

Then /^the value of "([^\"]*)" is "([^\"]*)"$/ do |key, value|
  assert_equal value, @env[key].to_s
end
