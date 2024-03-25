require 'rails_helper'

RSpec.describe Content, type: :model do

  subject(:content) { build(:content) }

  it { is_expected.to be_valid }

end
