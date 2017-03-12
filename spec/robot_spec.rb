require './lib/robot'
require './lib/table'

describe Robot do
  let(:table) {Table.new(5,5)}
  let(:robot) {Robot.new(table)}

  describe '#get direction' do
    context '#NORTH' do
      before {robot.run_command('PLACE 3,4,NORTH')}
      it { expect(robot.direction).to eq('NORTH') }
    end
    context '#EAST' do
      before {robot.run_command('PLACE 1,5,EAST')}
      it { expect(robot.direction).to eq('EAST') }
    end
    context '#SOUTH' do
      before {robot.run_command('PLACE 2,3,SOUTH')}
      it { expect(robot.direction).to eq('SOUTH') }
    end
    context '#WEST' do
      before {robot.run_command('PLACE 0,2,WEST')}
      it { expect(robot.direction).to eq('WEST') }
    end
  end

  describe '#change direction' do
    context '#LEFT' do
      context '#NORTH' do
        before {robot.run_command('PLACE 3,4,NORTH LEFT')}
        it { expect(robot.direction).to eq('WEST') }
      end
      context '#EAST' do
        before {robot.run_command('PLACE 1,5,EAST LEFT')}
        it { expect(robot.direction).to eq('NORTH') }
      end
      context '#SOUTH' do
        before {robot.run_command('PLACE 2,3,SOUTH LEFT')}
        it { expect(robot.direction).to eq('EAST') }
      end
      context '#WEST' do
        before {robot.run_command('PLACE 0,2,WEST LEFT')}
        it { expect(robot.direction).to eq('SOUTH') }
      end
    end

    context '#RIGHT' do
      context '#NORTH' do
        before {robot.run_command('PLACE 3,4,NORTH RIGHT')}
        it { expect(robot.direction).to eq('EAST') }
      end
      context '#EAST' do
        before {robot.run_command('PLACE 1,5,EAST RIGHT')}
        it { expect(robot.direction).to eq('SOUTH') }
      end
      context '#SOUTH' do
        before {robot.run_command('PLACE 2,3,SOUTH RIGHT')}
        it { expect(robot.direction).to eq('WEST') }
      end
      context '#WEST' do
        before {robot.run_command('PLACE 0,2,WEST RIGHT')}
        it { expect(robot.direction).to eq('NORTH') }
      end
    end
  end

  describe '#move' do
    context '#NORTH' do
      before {robot.run_command('PLACE 3,4,NORTH MOVE')}
      it { expect(robot.y).to eq(3) }
    end
    context '#EAST' do
      before {robot.run_command('PLACE 1,5,EAST MOVE')}
      it { expect(robot.x).to eq(2) }
    end
    context '#SOUTH' do
      before {robot.run_command('PLACE 2,3,SOUTH MOVE')}
      it { expect(robot.y).to eq(4) }
    end
    context '#WEST' do
      before {robot.run_command('PLACE 1,2,WEST MOVE')}
      it { expect(robot.x).to eq(0) }
    end
  end


  describe '#commands' do
    describe '#turn_left' do
      context '#NORTH' do
        let!(:save_position) {robot.save_position(2, 3, 'NORTH')}
        before { robot.turn_left }
        it { expect(robot.direction).to eq('WEST') }
      end
      context '#EAST' do
        let!(:save_position) {robot.save_position(1, 2, 'EAST')}
        before { robot.turn_left }
        it { expect(robot.direction).to eq('NORTH') }
      end
      context '#SOUTH' do
        let!(:save_position) {robot.save_position(0, 1, 'SOUTH')}
        before { robot.turn_left }
        it { expect(robot.direction).to eq('EAST') }
      end
      context '#WEST' do
        let!(:save_position) {robot.save_position(4, 0, 'WEST')}
        before { robot.turn_left }
        it { expect(robot.direction).to eq('SOUTH') }
      end
    end

    describe '#turn_right' do
      context '#NORTH' do
        let!(:save_position) {robot.save_position(2, 3, 'NORTH')}
        before { robot.turn_right }
        it { expect(robot.direction).to eq('EAST') }
      end
      context '#EAST' do
        let!(:save_position) {robot.save_position(2, 3, 'EAST')}
        before { robot.turn_right }
        it { expect(robot.direction).to eq('SOUTH') }
      end
      context '#SOUTH' do
        let!(:save_position) {robot.save_position(2, 3, 'SOUTH')}
        before { robot.turn_right }
        it { expect(robot.direction).to eq('WEST') }
      end
      context '#WEST' do
        let!(:save_position) {robot.save_position(2, 3, 'WEST')}
        before { robot.turn_right }
        it { expect(robot.direction).to eq('NORTH') }
      end
    end

    describe '#go_forward' do
      context '#NORTH' do
        let!(:save_position) {robot.save_position(2, 3, 'NORTH')}
        before { robot.go_forward }
        it { expect(robot.y).to eq(2) }
      end
      context '#EAST' do
        let!(:save_position) {robot.save_position(4, 2, 'EAST')}
        before { robot.go_forward }
        it { expect(robot.x).to eq(5) }
      end
      context '#SOUTH' do
        let!(:save_position) {robot.save_position(3, 2, 'SOUTH')}
        before { robot.go_forward }
        it { expect(robot.y).to eq(3) }
      end
      context '#WEST' do
        let!(:save_position) {robot.save_position(2, 2, 'WEST')}
        before { robot.go_forward }
        it { expect(robot.x).to eq(1) }
      end
    end
  end
end