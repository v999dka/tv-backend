# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

list = List.find_or_create_by(name: 'default')
(1..10).each do |i|
  Movie.find_or_create_by(title: "Movie#{i}", original_title: "Original Movie#{i}", year: 2023)
  TvShow.find_or_create_by(title: "TvShow#{i}", original_title: "Original TvShow#{i}", year: 2023)
end

TvShow.all.each_with_index do |show, index|
  s = Season.find_or_create_by(title: "Season#{index}", original_title: "Season#{index}", year: 2023, number: index, tv_show: TvShow.find(show.id))

  (1..5).each do |e|
    Episode.find_or_create_by(title: "Episode#{e}", original_title: "Episode#{e}", year: 2023, number: e, season: Season.find(s.id))
  end
end

[Movie.all, TvShow.all, Season.all, Episode.all].flatten.each do |content|
  ListContent.find_or_create_by(list: list, content: content)
end

puts "Seeds created successfully"
