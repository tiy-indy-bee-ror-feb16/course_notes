# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  Author.create!(
    name:     Faker::StarWars.character,
    bio:      Faker::Hipster.paragraphs.join("\n\n"),
    password: Faker::Internet.password
  )
end

20.times do
  Post.create!(
    title:    Faker::Book.title,
    body:     Faker::Hipster.paragraphs(15).join("\n\n"),
    authors: [Author.order("RANDOM()").first]
  )
end
