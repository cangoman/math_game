class Problem
  
  def initialize
    @operands = ['plus', 'minus']
  end

  def new_problem
    @number1 = Random.rand(1..20)
    @number2 = Random.rand(1..20)
    @operation = @operands.shuffle[0]

    "#{@number1} #{@operation} #{@number2}"
  end

  def result
    case @operation
    when 'plus'
      @number1 + @number2
    when 'minus'
      @number1 - @number2
    end
  end

end
