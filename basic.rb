require 'rubygems'
require 'treetop'

module Basic
  class BinaryOperation < Treetop::Runtime::SyntaxNode
    def eval(env={})
      operator.apply(operand_1.eval(env), operand_2.eval(env))
    end
  end
end

Treetop.load 'expression'
Treetop.load 'basic'

# program = <<-EOB
# 10 PRINT "Hello, Vegas!"
# 20 END
# 
# RUN
# EOB
# program = '4 != (x*2)'
program = 'PRINT "OH HAI"'

# parser = ExpressionParser.new
parser = LanguageParser.new
result = parser.parse(program)
if result
  puts 'SUCCESS:'
  puts result.eval#('x' => 3)
  puts
  puts result.inspect
else
  puts 'ERROR:'
  puts parser.terminal_failures.join("\n")
end
