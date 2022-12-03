class Exam < ApplicationRecord
    before_create :create_unique_identifier
    has_many :users_exams, dependent: :destroy
    has_many :users, through: :users_exam
    has_many :questions, dependent: :destroy

    def create_unique_identifier
        loop do
            self.code = SecureRandom.hex(5)
            break unless Exam.exists?(:code => code)
        end
    end
end
