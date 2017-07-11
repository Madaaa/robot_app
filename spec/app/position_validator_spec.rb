require 'spec_helper'

RSpec.describe PositionValidator do
  let (:position_validator) {
    PositionValidator.new
  }

  describe 'when_vertical_valid?' do 
    context 'a valid context' do 
      it { expect(position_validator.when_vertical_valid? 3).to be_truthy }
    end

    context 'an valid context' do 
      it { expect(position_validator.when_vertical_valid? 9).to be_falsey }
    end
  end

  describe 'when_horizontal_valid?' do 
    context 'a valid context' do 
      it { expect(position_validator.when_horizontal_valid? 3).to be_truthy }
    end

    context 'an valid context' do 
      it { expect(position_validator.when_horizontal_valid? 9).to be_falsey }
    end
  end

  describe 'valid?' do 
    context 'a valid context' do 
      it { expect(position_validator.valid? 1, 1).to be_truthy }
    end

    context 'an invalid context' do 
      it { expect(position_validator.valid? 1, 9).to be_falsey }
    end
  end
end