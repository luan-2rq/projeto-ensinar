class AddDescriptionToClassrooms < ActiveRecord::Migration[7.0]
  def change
    add_column :classrooms, :description, :text
  end
end
