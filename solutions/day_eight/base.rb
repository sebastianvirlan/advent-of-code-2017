module DayEight
  class Base

    def initialize(input)
      @input = input.split(/\n+/).map { |row| row.gsub('inc', '+=').gsub('dec', '-=') }
    end

    def resolve
      eval(syntax)
    end

    private

    def input_variables
      @input.map { |row| row.split[0] }.uniq
    end

    def variables_declaration
      input_variables.map { |var| "#{var} = 0"}.join(';')
    end

    def variables_arr
      "[#{input_variables.join(',')}].max"
    end
  end
end
