class AddCodeToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :code, :string
  end
end
