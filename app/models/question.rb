class Question < ApplicationRecord
  enum :difficulty, easy: 0, medium: 1, hard: 2

  has_one :close_ended_question, class_name: 'CloseEndedQuestion', dependent: :destroy
  has_one :open_ended_question, class_name: 'OpenEndedQuestion', dependent: :destroy

  belongs_to :exam
end