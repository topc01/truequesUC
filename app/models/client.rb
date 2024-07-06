class Client < ApplicationRecord
    include ImageUploader::Attachment(:image)
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    has_many :chats, dependent: :destroy, foreign_key: :client1_id
    has_many :chats, dependent: :destroy, foreign_key: :client2_id
    has_many :messages, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :reviews, foreign_key: :sender_id, dependent: :destroy
    has_many :products, dependent: :destroy
    has_many :requests, :through => :products

    validates :username, :email, :encrypted_password, presence: true
end
