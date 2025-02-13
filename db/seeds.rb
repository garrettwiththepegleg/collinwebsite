# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
require 'csv'

CSV.foreach(Rails.root.join('db', 'current_mlb_players.csv'), headers: true) do |row|
  Player.create!(
    name: row['Name'],
    player_id: row['IDfg'],
    league: 'MLB'
  )
end

CSV.foreach(Rails.root.join('db', 'prospects.csv'), headers: true) do |row|
    Player.create!(
      name: row['full_name'],
      player_id: row['playerId'],
      league: 'MiLB'
    )
  end

  CSV.foreach(Rails.root.join('db', 'everything.csv'), headers: true) do |row|
    Profile.create!(
      player_name: row['Name'],
      player_id: 1,
      league: 'MiLB',
      reference_player: row['reference'],
      pull: row['Pull%'],
      center: row['Cent%'],
      oppo: row['Oppo%'],
      fb: row['FB%'],
      gb: row['GB%'],
      ld: row['LD%'],
      hr: row['HR/FB'],
      iffb: row['IFFB%'],
      score: row['Score']
    )
  end

  CSV.foreach(Rails.root.join('db', 'finalwork.csv'), headers: true) do |row|
    Score.create!(
      player_name: row['Name'],
      player_id: 1,
      league: 'MiLB',
      reference_player: row['reference'],
      iso: row['ISO_Percentile'],
      spd: row['Spd_Percentile'],
      woba: row['wOBA_Percentile'],
      wrc_plus: row['wRC+_Percentile'],
      obp: row['OBP_Percentile'],
      score: row['Score']
    )
  end



puts "Seeded #{Player.count} players."