require 'ffaker'

#  id          :integer          not null, primary key
#  title       :string(255)      not null
#  summary     :string(255)      not null
#  story       :text(65535)      not null
#  cover_id    :string(255)
#  is_open     :boolean          default(TRUE)
#  author_id   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  template_id :integer

FactoryGirl.define do
  factory :page do
    title { FFaker::Book.title }
    summary { FFaker::Book.genre }
    story { FFaker::Book.description }
    cover_id { FFaker::Book.cover}
    is_open { FFaker::Boolean.random }
		template_id 1
		association :author, factory: :author
		association :category, factory: :category
		association :template, factory: :template
  end
end
