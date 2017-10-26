# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  page_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ApplicationRecord
  belongs_to :author
  belongs_to :page
end
