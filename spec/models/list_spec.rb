require 'rails_helper'

RSpec.describe List, type: :model do
  subject(:list) { described_class.new }

  it 'factory is valid' do
    expect(build(:list)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to have_many(:list_contents) }
    it { is_expected.to have_many(:contents).through(:list_contents) }
  end

end
