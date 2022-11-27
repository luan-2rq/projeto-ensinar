class Classroom < ApplicationRecord
    has_many :exam
    has_and_belongs_to_many :user

end
