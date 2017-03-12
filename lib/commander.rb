class Commander
  def initialize(robot, table, command)
    @robot = robot
    @table = table
    @command = command
  end

  def parse
    instructions = @command.scan(/^PLACE\s(\d+,\d+),(#{Robot::DIRECTIONS.join('|')})?\s?(.*?)?$/).first
    if instructions
      x, y = instructions[0].split(',').map(&:to_i)
      direction = instructions[1]
      commands = instructions[2].split(' ').map(&:upcase)
      if @table.inside?(x, y)
        @robot.save_position(x, y, direction) 
        perform(commands)
      end
    end
  end

  private

  def perform(commands)
    commands.each do |command|
      case command
        when 'LEFT'
          @robot.turn_left
        when 'RIGHT'
          @robot.turn_right
        when 'MOVE'
          @robot.go_forward
        when 'REPORT'
          @robot.report
      end
    end
  end
end