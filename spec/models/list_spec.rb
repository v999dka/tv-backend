require 'rails_helper'

RSpec.describe List do
  subject(:list) { build(:list) } 

  it { is_expected.to be_valid }

  describe 'relationships' do
    it { is_expected.to have_many(:list_contents) }
    it { is_expected.to have_many(:contents).through(:list_contents) }
  end

end
