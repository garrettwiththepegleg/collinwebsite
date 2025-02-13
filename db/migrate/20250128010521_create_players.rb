class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :player_id
      t.string :league
      t.timestamps
    end
  end
end
