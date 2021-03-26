class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15}
  validates :email, presence: true,format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
  validates :password, presence: true, length: { in: 8..32 },format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
  
  has_secure_password
  
  has_many :topics
  
end
