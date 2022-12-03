class AddAnsweredToUsersExams < ActiveRecord::Migration[7.0]
  def change
    add_column :users_exams, :answered, :boolean
  end
end
