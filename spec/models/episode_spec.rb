require 'rails_helper'

RSpec.describe Episode, type: :model do
  subject(:episode) { described_class.new }

  it 'factory is valid' do
    expect(build(:episode)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:season) }
  end

end

