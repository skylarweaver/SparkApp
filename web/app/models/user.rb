class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # JSON auth_token
  acts_as_token_authenticatable
  

  # relationships
  has_many :owned_devices
  has_many :devices, through: :owned_devices
  has_many :transactions
end
