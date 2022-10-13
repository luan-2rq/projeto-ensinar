class CreateCloseEndedReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :close_ended_replies do |t|
      t.belongs_to :user, foreign_key: true, index: true
      t.belongs_to :exam, foreign_key: true, index: true
      t.integer :reply
      t.boolean :correct

      t.timestamps
    end
  end
end
