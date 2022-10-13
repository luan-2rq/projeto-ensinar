class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.belongs_to :classroom, foreign_key: true, index: true
      t.text :name
      t.text :description
      t.datetime :start_date
      t.datetime :due_date
      t.boolean :duration
      t.bigint :time_limit

      t.timestamps
    end
  end
end
