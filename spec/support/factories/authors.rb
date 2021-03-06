require 'ffaker'

FactoryBot.define do
  pass = FFaker::Internet.password(8)
  factory :author do
    pen_name { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password pass
    password_confirmation pass
  end

  factory :invalid_author do
    email nil
  end
end
