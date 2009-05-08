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
  result = parser.parse('ABS -14')
  if result
    puts 'SUCCESS:'
    puts result.eval.inspect
    puts
    puts result.inspect
  else
    puts 'ERROR:'
    puts parser.terminal_failures.join("\n")
  end
end
