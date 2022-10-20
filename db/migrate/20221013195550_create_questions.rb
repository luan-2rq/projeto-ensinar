class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :difficulty, default: 0

      t.timestamps
    end
  end
end
