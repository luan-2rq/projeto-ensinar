class CreateClassrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :code
      t.boolean :enabled
      t.integer :professor_id

      t.timestamps
    end
  end
end
