class Question < ApplicationRecord
  enum :difficulty, easy: 0, medium: 1, hard: 2

  belongs_to :exam, dependent: :destroy
end