require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject(:movie) { build(:movie) }

  it { is_expected.to be_valid }

end
