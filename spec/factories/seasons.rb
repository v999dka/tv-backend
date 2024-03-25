FactoryBot.define do
  factory :season, parent: :content do
    title { Faker::Name.title }
    original_title { Faker::Name.title }
    tv_show { build(:tv_show) }
  end
end
