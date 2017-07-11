require 'spec_helper'

RSpec.describe Facing do
  let (:valid_facing) {
    Facing.new(:south)
  }

  let (:invalid_facing) {
    Facing.new(:invalid)
  }

  describe 'valid?' do 
    context 'a valid context' do 
      it { expect(valid_facing.valid?).to be_truthy }
    end

    context 'an invalid context' do 
      it { expect(invalid_facing.valid?).to be_falsey }
    end
  end

  describe 'facing' do 
    it { expect(valid_facing.next).to eq(:west) }
  end

  describe 'previous' do 
    it { expect(valid_facing.previous).to eq(:east) }
  end
end
