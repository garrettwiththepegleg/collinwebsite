class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles do |t|
      t.string :player_name
      t.float :player_id
      t.float :pull
      t.float :center
      t.float :oppo
      t.float :fb
      t.float :gb
      t.float :ld
      t.float :hr
      t.float :iffb
      t.string :league
      t.string :reference_player
      t.float :score
    end
  end
end
