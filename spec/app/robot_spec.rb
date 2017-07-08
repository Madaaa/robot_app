require 'spec_helper'

RSpec.describe Robot do
  let(:robot) {
    Robot.new
  }

  describe 'place' do

    context 'valid context' do
      context 'with integer values' do
        before do
          robot.place(1, 2, :north)
        end

        it { expect(robot.position).to eq(Position.new(1, 2)) }

        it { expect(robot.facing).to eq(Facing.new(:north)) }
      end

      context 'with string values' do
        before do
          robot.place('1', '2', 'NORTH')
        end

        it { expect(robot.position).to eq(Position.new(1, 2)) }

        it { expect(robot.facing).to eq(Facing.new(:north)) }
      end
    end

    context 'invalid context' do
      before do
        robot.place(-1, -1, :north)
      end

      it { expect(robot.placed?).to be_falsey }
    end
  end

  describe 'move' do
    context 'when it is placed safety' do
      before do
        robot.place(1, 1, :north)
        robot.move
      end

      it { expect(robot.position).to eq(Position.new(1, 2)) }
    end

    context 'when it is placed on border' do
      before do
        robot.place(4, 4, :north)
        robot.move
      end

      it { expect(robot.position).to eq(Position.new(4, 4)) }
    end
  end

  describe 'left' do
    before do
      robot.place(1, 1, :north)
      robot.left
    end

    it { expect(robot.facing).to eq(Facing.new(:west)) }
  end

  describe 'right' do
    before do
      robot.place(1, 1, :north)
      robot.right
    end

    it { expect(robot.facing).to eq(Facing.new(:east)) }
  end
end
