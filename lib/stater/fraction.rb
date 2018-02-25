module Stater
  class FractionSolver
    # solves expressions in the form of '2 1/2 + 3 3/5'
    def solve(expression)
      x, op, y = expression.split(/\ (\+|\-|\*|\/)\ /)
      x = x.split(' ').sum {|n| n.strip.to_r }
      y = y.split(' ').sum {|n| n.strip.to_r }
      x.send(op.strip.to_sym, y)
    end
  end
end
