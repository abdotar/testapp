class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.text :text
      t.boolean :isCompleted
      t.belongs_to :project, index:true

      t.timestamps
    end
  end
end
