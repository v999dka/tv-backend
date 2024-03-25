require 'rails_helper'

RSpec.describe Movie do

  context 'validates' do

    it 'is valid' do
      expect(build(:movie)).to be_valid
    end

  end

end
