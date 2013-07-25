class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.timestamps

      t.string :description
    end
  end
end
