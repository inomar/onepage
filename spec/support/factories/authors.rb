require 'ffaker'
FactoryGirl.define do
  factory :author do
    name { FFaker::Name.name }
    pen_name { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end

  factory :invalid_author do
    email nil
  end
end
