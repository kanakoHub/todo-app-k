class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name #文字列型（短い文字列）
      t.text :description #テキスト型（長い文字列）
      t.timestamps
    end
  end
end
