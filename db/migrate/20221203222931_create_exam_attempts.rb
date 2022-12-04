class CreateExamAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_attempts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :exam, null: false, foreign_key: true
      t.datetime :start_date
      t.boolean :answered
      t.boolean :corrected
      t.float :grade

      t.timestamps
    end
  end
end
