require 'rails_helper'

RSpec.describe TvShow do
  let(:tv_show) { build(:tv_show) }

  it 'is valid' do
    expect(tv_show).to be_valid
  end

  describe 'relationships' do

    it 'is expected to have relationship with Season' do
      expect(tv_show).to have_many(:seasons).dependent(:destroy)
    end

  end


end
