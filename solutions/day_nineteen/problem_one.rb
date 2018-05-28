# frozen_string_literal: true

module DayNineteen
  class MatrixSeeker
    UPP           = :upp
    DOWN          = :down
    LEFT          = :left
    RIGHT         = :right
    BREAKPOINT    = '+'
    END_OF_MATRIX = ' '
    SEARCH_PATTERN = /[[:alpha:]]/

    STARTING_FROM = UPP

    attr_accessor :chars

    def initialize(top, left, direction = DOWN)
      @top        = top
      @left       = left
      @direction  = direction
      @chars  = []
    end

    def for(matrix)
      @matrix = matrix
      self
    end

    def navigate
      raise 'Matrix not specified' unless @matrix

      return go_down  if @direction == DOWN
      return go_right if @direction == RIGHT
      return go_left  if @direction == LEFT

      go_up if @direction == UPP
    end

    def go_down
      navigate_row(@matrix[(@top + 1)..-1]) do |top_index|
        @top += top_index + 1
      end
    end

    def go_up
      navigate_row(@matrix.reverse[(@matrix.length - @top)..-1]) do |top_index|
        @top -= top_index + 1
      end
    end

    def go_right
      navigate_column(current_row[(@left + 1)..-1]) do |ending_index|
        @left += ending_index + 1
      end
    end

    def go_left
      navigate_column(current_row.reverse[(current_row.length - @left)..-1]) do |ending_index|
        @left -= ending_index + 1
      end
    end

    def navigate_row(array)
      array.each_with_index do |row, top_index|
        break if row[@left] == END_OF_MATRIX
        collect_chars_from_row(row[@left])
        next unless row[@left] == BREAKPOINT
        yield(top_index)
        @direction = next_direction
        navigate
        break
      end
    end

    def navigate_column(column)
      ending_position = column.find_index(BREAKPOINT)
      final_position  = column[0..(ending_position || -1)].find_index(END_OF_MATRIX)
      collect_chars_from_column(column[0..(ending_position || final_position)])
      return if final_position
      yield(ending_position)
      @direction = next_direction
      navigate
    end

    def current_row
      @matrix[@top]
    end

    def collect_chars_from_column(column)
      @chars << column.select { |c| c =~ SEARCH_PATTERN }
    end

    def collect_chars_from_row(char)
      @chars << char if char =~ SEARCH_PATTERN
    end

    def next_direction
      alphabet = ('A'..'Z').to_a
      return neighbours.find { |_k, v| alphabet.push('-').include?(v) }.first if %i[upp down].include?(@direction)
      neighbours.find { |_k, v| alphabet.push('|').include?(v) }.first        if %i[left right].include?(@direction)
    end

    def neighbours
      {
        left:   @matrix.dig(@top, @left - 1) || '',
        right:  @matrix.dig(@top, @left + 1) || '',
        upp:    @matrix.dig(@top - 1, @left) || '',
        down:   @matrix.dig(@top + 1, @left) || ''
      }
    end
  end

  class ProblemOne
    def initialize(input)
      @input = input.split(/\n+/).map { |r| r.each_char.to_a }
    end

    def resolve
      navigator = MatrixSeeker.new(0, start_position).for(@input)
      navigator.navigate
      navigator.chars.join
    end

    def top_row
      @input.first
    end

    def start_position
      top_row.find_index('|')
    end
  end
end
