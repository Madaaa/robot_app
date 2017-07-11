require 'spec_helper'

RSpec.describe Position do
  let (:valid_position) {
    Position.new(1, 1)
  }

  let (:invalid_position) {
    Position.new(-1, -1)
  }

  describe 'valid?' do 
    context 'a valid context' do 
      it { expect(valid_position.valid?).to be_truthy }
    end

    context 'an invalid context' do 
      it { expect(invalid_position.valid?).to be_falsey }
    end
  end

  describe 'left' do 
    before do 
      valid_position.left
    end

    it { expect(valid_position.x).to eq(0) }
  end


  describe 'left' do 
    context 'a valid context' do
      before do 
        valid_position.left
      end

      it { expect(valid_position.x).to eq(0) }
    end

    context 'an invalid context' do 
      let (:border_position) {
        Position.new(0, 0)
      }

      before do 
        border_position.left
      end

      it { expect(border_position.x).to eq(0) }
    end
  end

  describe 'right' do 
    before do 
      valid_position.right
    end

    it { expect(valid_position.x).to eq(2) }
  end

  describe 'up' do 
    before do 
      valid_position.up
    end

    it { expect(valid_position.y).to eq(2) }
  end

  describe 'down' do 
    before do 
      valid_position.down
    end

    it { expect(valid_position.y).to eq(0) }
  end
end