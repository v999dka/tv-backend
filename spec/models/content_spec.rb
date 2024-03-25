require 'rails_helper'

RSpec.describe Content do

  context 'validates' do

    it 'is valid' do
      expect(build(:content)).to be_valid
    end

  end

end
