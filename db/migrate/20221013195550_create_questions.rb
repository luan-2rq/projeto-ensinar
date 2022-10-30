class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :difficulty, default: 0
      t.boolean :isClosed
      t.json :alternatives, null: true
      t.string :correct_alternative, null: true
      t.string :possible_reply, null: true

      t.timestamps
    end
  end
end
