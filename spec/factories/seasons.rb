FactoryBot.define do
  factory :season, parent :content do
    title { Faker::Name.title }
    original_title { Faker::Name.title }
  end
end
