FactoryBot.define do
  factory :list_content do
    content { build(:content) }
    list { build(:list) }
  end
end
