# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do
  user = User.create!(
    username:  Faker::Internet.user_name,
    email:     Faker::Internet.safe_email,
    password:  Faker::Internet.password,
    bio:       Faker::Lorem.paragraphs(2).join("\n\n"),
    image_url: Faker::Avatar.image(nil, '80x80')
  )
  100.times do
    user.cheeps << Cheep.new(
      body: Faker::Hacker.say_something_smart,
      created_at: Faker::Time.between(6.months.ago, DateTime.now)
    )
  end
end
