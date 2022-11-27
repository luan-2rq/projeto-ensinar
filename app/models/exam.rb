class Exam < ApplicationRecord
    before_create :create_unique_identifier
    belongs_to :user, dependent: :destroy

    def create_unique_identifier
        loop do
            self.code = SecureRandom.hex(5)
            break unless Exam.exists?(:code => code)
        end
    end
end
