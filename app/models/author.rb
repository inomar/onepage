class Author < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 50 }
  validates :pen_name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :password, length: { in: 6..18 }
  validates :description, length: { maximum: 1000 }

  attachment :image
end
