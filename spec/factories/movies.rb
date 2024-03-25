FactoryBot.define do
  factory :movie, parent :content do
    title { Faker::Movie.title }
    original_title { Faker::Movie.title }
  end
end
