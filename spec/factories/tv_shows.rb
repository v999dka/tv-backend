FactoryBot.define do
  factory :tv_show, parent: :content do
    title { Faker::Movie.title }
    original_title { Faker::Movie.title }
  end
end
