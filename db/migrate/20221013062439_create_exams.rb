class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.text :name
      t.text :description
      t.datetime :start_date
      t.datetime :due_date
      t.boolean :duration
      t.integer :time_limit

      t.timestamps
    end
  end
end
