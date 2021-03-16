class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :room_users
         has_many :rooms, through: :room_users, dependent: :destroy
         has_many :messages, dependent: :destroy
         has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :following, through: :active_relationships
         
         mount_uploader :image, ImageUploader
         

         validates :last_name, presence: true
         validates :first_name, presence: true
         validates :self_introduction, presence: true, length: { maximum: 1000 }

         def following?(other_user)
          following.include?(other_user)
        end

        def self.guest
          find_or_create_by!(email: 'test@testtest9.com') do |user|
            user.password = SecureRandom.urlsafe_base64
            user.password_confirmation = user.password
            user.last_name = 'yamada'
            user.first_name = 'taro'
            user.self_introduction = 'Hello'
            user.image = 'mate-pic2.jpg'
         end
      end   
end
