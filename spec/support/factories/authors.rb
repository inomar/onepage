require 'ffaker'

FactoryGirl.define do
  pass = FFaker::Internet.password(8)
  factory :author do
    name { FFaker::Name.name }
    pen_name { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password pass
    password_confirmation pass
  end

  factory :invalid_author do
    email nil
  end
end
