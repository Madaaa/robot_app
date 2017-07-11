require 'spec_helper'

RSpec.describe Table do
  let (:position) {
    Position.new(0, 0)
  }

  let (:facing) {
    Facing.new(:north)
  }

  let (:table) {
    Table.new(position, facing)
  }

  describe 'x_axis' do 
    it { expect(table.x_axis).to eq(4) }
  end

  describe 'y_axis' do 
    it { expect(table.y_axis).to eq(0) }
  end

  describe 'report' do 
    it { expect(table.report).to include('ʌ') } 
  end
end 