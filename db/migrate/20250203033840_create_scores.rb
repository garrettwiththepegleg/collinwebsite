class CreateScores < ActiveRecord::Migration[8.0]
  def change
    create_table :scores do |t|
      t.string :player_name
      t.integer :player_id
      t.float :iso
      t.float :spd
      t.float :woba
      t.float :wrc_plus
      t.float :obp
      t.float :score
      t.string :league
      t.string :reference_player
      
    end
  end
end
