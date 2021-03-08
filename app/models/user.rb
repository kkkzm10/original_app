class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         attr_accessor :image_cache
         mount_uploader :image, ImageUploader

         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :self_introduction, presence: true, length: { maximum: 1000 }
end
