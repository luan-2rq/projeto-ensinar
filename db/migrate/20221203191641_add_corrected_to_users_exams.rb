class AddCorrectedToUsersExams < ActiveRecord::Migration[7.0]
  def change
    add_column :users_exams, :corrected, :boolean
  end
end
