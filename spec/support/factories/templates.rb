FactoryGirl.define do
  factory :template do
    title "MyString"
    summary "MyString"
    description "MyText"
    cover_id 1
    category_id 1
    is_open false
    author_id 1
  end
end
