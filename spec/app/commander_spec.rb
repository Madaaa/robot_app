require 'spec_helper'

RSpec.describe Commander do
  let (:commander) {
    Commander.new
  }

  let (:robot) {
    commander.robot
  }

  describe 'execute' do
    context 'a valid context' do
      before do
        commander.execute('PLACE', ['1', '2', 'NORTH'])
      end

      it { expect(commander.robot.position).to eq(Position.new(1, 2)) }

      it { expect(commander.robot.facing).to eq(Facing.new(:north)) }
    end

    context 'invalid context' do
      context 'unknown command' do
        it { expect(commander.execute('unknown')).to start_with('Invalid command') }
      end

      context 'wrong numbers of argumments' do
        it { expect(commander.execute('PLACE')).to start_with('Invalid command') }
      end
    end
  end
end
