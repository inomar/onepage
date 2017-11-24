# == Schema Information
#
# Table name: authors
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  pen_name               :string(255)
#  image_id               :string(255)
#  description            :text(65535)
#  other                  :text(65535)
#  social_profile_id      :integer
#

class Author < ApplicationRecord
  has_many :social_profiles, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :templates, dependent: :destroy
  has_many :favorites
  # has_many :pages, through: :favorites

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, unless: :twitter?
  validates :pen_name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :description, length: { maximum: 1000 }

  attachment :image

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def twitter?
    social_profile('twitter') == 'twitter'
  end

  # def update_without_current_password(params, *options)
  #   params.delete(:current_password)
  #
  #   if params[:password].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation) if params[:password_confirmation].blank?
  #   end
  #
  #   clean_up_passwords
  #   pp params
  #   update_attributes(params, *options)
  # end
end
