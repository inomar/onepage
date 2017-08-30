# == Schema Information
#
# Table name: social_profiles
#
#  id            :integer          not null, primary key
#  author_id     :integer
#  access_token  :string(255)
#  provider      :string(255)
#  access_secret :string(255)
#  uid           :string(255)
#  name          :string(255)
#  pen_name      :string(255)
#  email         :string(255)
#  url           :string(255)
#  image_url     :string(255)
#  description   :string(255)
#  other         :text(65535)
#  credentials   :text(65535)
#  raw_info      :text(65535)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe SocialProfile, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
