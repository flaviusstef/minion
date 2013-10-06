class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
    end

    add_column :tasks, :project_id, :integer
    add_index :tasks, :project_id, default:0
  end
end
