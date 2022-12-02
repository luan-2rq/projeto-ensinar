class User < ApplicationRecord
  has_many :users_exams, dependent: :destroy
  has_many :exams, through: :users_exams
  has_many :replies

  validates :name, presence:  true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
