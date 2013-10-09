require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'example@example.com'
    password 'foobarbaz'
    password_confirmation 'foobarbaz'
  end

  factory :album do
    name 'kittens'
  end
end