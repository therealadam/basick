require 'rubygems'
require 'treetop'

class BinaryOperation < Treetop::Runtime::SyntaxNode
  def eval(env={})
    operator.apply(operand_1.eval(env), operand_2.eval(env))
  end
end

Treetop.load 'expression'
Treetop.load 'basic'

if __FILE__ == $PROGRAM_NAME
  parser = LanguageParser.new
  program = <<-EOP
    LET a := 2 + 2
    LET b := 4 + 4
    
    SQRT 9
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
