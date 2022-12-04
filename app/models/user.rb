class User < ApplicationRecord
  has_many :exam_attempts, dependent: :destroy
  has_many :exams, through: :exam_attempts
  has_many :replies

  validates :name, presence:  true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
