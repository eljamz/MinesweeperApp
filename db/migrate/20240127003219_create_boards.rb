class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.integer :width
      t.integer :height
      t.integer :mines_count
      t.string :name
      t.string :email
      t.text :board_state

      t.timestamps
    end
  end
end
