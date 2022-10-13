class Exam < ApplicationRecord
    belongs_to :classroom, dependent: :destroy
end
