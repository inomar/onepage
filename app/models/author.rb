class Author < ApplicationRecord
  has_many :social_profiles, dependent: :destroy
  has_many :pages, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true, unless: :twitter?
  validates :name, presence: true, length: { maximum: 50 }
  validates :pen_name, presence: true, length: { maximum: 50 }, uniqueness: true
  #validates :password, length: { in: 6..18 }, unless: :twitter?
  validates :description, length: { maximum: 1000 }

  attachment :image

  def social_profile(provider)
    social_profiles.select{ |sp| sp.provider == provider.to_s }.first
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
