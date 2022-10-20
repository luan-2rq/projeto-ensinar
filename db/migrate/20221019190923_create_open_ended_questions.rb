class CreateOpenEndedQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :open_ended_questions, id: false, primary_key: :question_id do |t|
      t.belongs_to :question, class_name: 'question', foreign_key: 'question_id', null: false
      t.string :possible_reply

      t.timestamps
    end
  end
end
