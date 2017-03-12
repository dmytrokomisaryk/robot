require './lib/commander'

class Robot
  DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze

  attr_reader :x, :y, :direction

  def initialize(table)
    @table = table
  end

  def run_command(command)
    Commander.new(self, @table, command).parse
  end

  def save_position(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def turn_left
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) - 1) % 4]
  end

  def turn_right
    @direction = DIRECTIONS[(DIRECTIONS.index(@direction) + 1) % 4]
  end

  def go_forward
    case @direction
      when 'NORTH'
        @y -= 1 if @table.inside?(@x,@y-1)
      when 'EAST'
        @x += 1 if @table.inside?(@x+1,@y)
      when 'SOUTH'
        @y += 1 if @table.inside?(@x,@y+1)
      when 'WEST'
        @x -= 1 if @table.inside?(@x-1,@y)
    end
  end

  def report
    msg = if x && y && direction
      [x, y, direction].join(',')
    else
      'position is not defined'
    end
    p msg
  end 
end