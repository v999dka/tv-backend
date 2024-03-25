require 'rails_helper'

RSpec.describe TvShow, type: :model do
  subject(:tv_show) { described_class.new }

  it 'factory is valid' do
    expect(build(:tv_show)).to be_valid
  end

  describe 'relationships' do

    it { is_expected.to have_many(:seasons).dependent(:destroy) }

  end


end
