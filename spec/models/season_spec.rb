require 'rails_helper'

RSpec.describe Season do
  let(:season) { build(:season) }

  it 'factory is valid' do
    expect(season).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:tv_show) }
    it { is_expected.to have_many(:episodes).dependent(:destroy) }
  end

end
