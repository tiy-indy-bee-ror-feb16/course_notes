FactoryGirl.define do
  factory :gif do
    image_url { Giphy.random('american psycho').image_original_url }
    user
  end
end
