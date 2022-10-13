class CreateCloseEndedQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :close_ended_questions do |t|
      t.belongs_to :exam, foreign_key: true, index: true
      t.text :description
      t.string :difficulty
      t.text :alternative_a
      t.text :alternative_b
      t.text :alternative_c
      t.text :alternative_d
      t.integer :correct_alternative

      t.timestamps
    end
  end
end
