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

class SocialProfile < ApplicationRecord
  belongs_to :author
  store :other
  validates_uniqueness_of :uid, scope: :provider

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']
    credentials = omniauth['credentials']
    info = omniauth['info']

    self.access_token = credentials['token']
    self.access_secret = credentials['secret']
    self.credentials = credentials.to_json
    self.email = info['email']
    self.name = info['name']
    self.pen_name = info['nickname']
    self.description = info['description'].try(:truncate, 255)
    self.image_url = info['image']
    case provider.to_s
    when 'twitter'
      self.url = info['urls']['Twitter']
      other[:location] = info['location']
      other[:website] = info['urls']['Website']
    end

    set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    case provider.to_s
    when 'twitter'
      other[:followers_count] = raw_info['followers_count']
      other[:friends_count] = raw_info['friends_count']
      other[:statuses_count] = raw_info['statuses_count']
    end

    self.raw_info = raw_info.to_json
    save!
  end

  def self.select_provider(provider, uid)
    where(provider: provider, uid: uid)
  end
end
