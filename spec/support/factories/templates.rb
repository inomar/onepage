require 'ffaker'

#  id          :integer          not null, primary key
#  subject     :string(255)      not null
#  title       :string(255)
#  summary     :string(255)
#  description :text(65535)      not null
#  cover_id    :string(255)
#  category_id :integer
#  is_open     :boolean
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null

FactoryGirl.define do
  factory :template do
    subject { FFaker::Book.title }
    title { FFaker::Book.title }
    summary { FFaker::Book.genre }
    description { FFaker::Book.description }
    cover_id { FFaker::Book.cover }
    is_open false
    association :author, factory: :author
    association :category, factory: :category

    factory :invalid_template do
      subject nil
    end
  end
end
