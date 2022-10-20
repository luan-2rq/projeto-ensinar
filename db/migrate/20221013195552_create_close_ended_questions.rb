class CreateCloseEndedQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :close_ended_questions, id: false, primary_key: :question_id do |t|
      t.belongs_to :question, class_name: 'question', foreign_key: 'question_id', null: false
      t.json :alternatives
      t.string :correct_alternative

      t.timestamps
    end
  end
end
