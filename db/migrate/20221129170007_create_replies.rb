class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.belongs_to :exam, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :question, null: false, foreign_key: true
      t.text :answer
      t.float :grade
      t.boolean :correct

      t.timestamps
    end
  end
end
