class AddStartDateToUsersExams < ActiveRecord::Migration[7.0]
  def change
    add_column :users_exams, :start_date, :date
  end
end
