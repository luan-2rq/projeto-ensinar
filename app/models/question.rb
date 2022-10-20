class Question < ApplicationRecord
  enum :difficulty, easy: 0, medium: 1, hard: 2

  has_many :close_ended_questions, dependent: :destroy
  has_many :open_ended_questions, dependent: :destroy
end