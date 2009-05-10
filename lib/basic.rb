require 'rubygems'
require 'treetop'

class BinaryOperation < Treetop::Runtime::SyntaxNode
  def eval(env={})
    operator.apply(operand_1.eval(env), operand_2.eval(env))
  end
end

class PrintNode < Treetop::Runtime::SyntaxNode
  
  @@output = nil
  
  def self.output=(io)
    @@output = io
  end
  
  def eval(env={})
    @@output.write(s.eval)
    env
  end
end

Treetop.load File.join(File.dirname(__FILE__), 'expression')
Treetop.load File.join(File.dirname(__FILE__), 'basic')

if __FILE__ == $PROGRAM_NAME
  parser = LanguageParser.new
  PrintNode.output = STDOUT
  program = <<-EOP
    PRINT "Hi"
  EOP
  result = parser.parse(program.strip)
  if result
    puts 'SUCCESS:'
    puts result.inspect
    puts
    puts result.eval.inspect
  else
    puts 'ERROR:'
    puts parser.terminal_failures.join("\n")
  end
end
