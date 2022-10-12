class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :due_date
      t.integer :time_limit

      t.timestamps
    end
  end
end
