DR_WHO_GIFS = Giphy.search('doctor who', {limit: 50})

counter = 0
10.times do
  user = User.create!(
    email: Faker::Internet.safe_email,
    username: Faker::Internet.user_name(nil, []),
    password: Faker::Internet.password(10, 20)
  )

  5.times do
    url = DR_WHO_GIFS[counter].original_image.url.to_s
    user.gifs << Gif.new(image_url: url)
    counter = counter + 1
  end
end

