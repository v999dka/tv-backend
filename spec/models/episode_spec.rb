require 'rails_helper'

RSpec.describe Episode do
  let(:episode) { build(:episode) }

  it 'factory is valid' do
    expect(episode).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:season) }
  end

end

