class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.text :description
      t.integer :points
      t.boolean :status

      t.timestamps
    end
  end
end
