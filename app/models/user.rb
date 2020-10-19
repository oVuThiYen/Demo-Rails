class User < ApplicationRecord
  validates :age, numericality: { greater_than: 10 }
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/}, length: { in: 4..20 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, length: { in: 4..20 }
  has_secure_password
  has_one :user_info, class_name: 'UserInfo', foreign_key: 'user_id'
  has_many :pets, class_name: 'Pet', foreign_key: 'user_id'
end
