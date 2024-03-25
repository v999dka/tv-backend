require 'rails_helper'

RSpec.describe ListContent, type: :model do
  subject(:list_content) { described_class.new }

  it 'factory is valid' do
    expect(build(:list_content)).to be_valid
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:content) }
    it { is_expected.to belong_to(:list) }
  end

  describe 'validation' do
    it { is_expected.to have_db_index(%i[list_id content_id]).unique }
  end

end
