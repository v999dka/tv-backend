require 'rails_helper'

RSpec.describe Season, type: :model do
  subject(:season) { described_class.new }

  it 'factory is valid' do
    expect(build(:season)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:tv_show) }
    it { is_expected.to have_many(:episodes).dependent(:destroy) }
  end

end
