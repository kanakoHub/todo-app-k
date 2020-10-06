class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false
      t.references :board, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.date :closing_day
      t.timestamps
    end
  end
end
