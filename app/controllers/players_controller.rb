require 'net/http'
require 'json'

class PlayersController < ApplicationController
  def search
    @players = Player.where(league: 'MiLB').order(:Name).pluck(:Name) # Fetch player names for the dropdown
    @left_percentage = 25.0
    @center_percentage = 30.0
    @right_percentage = 45.0
    if params[:player_name].present?
      player_name = params[:player_name].strip.gsub(' ', '_') # Format the player name
      player = Player.find_by(Name: params[:player_name]) # Fetch player from the database
      api_url = "https://collinapi.onrender.com/mlbheadshot/#{player_name}"
      if player.present?
        if player.league == 'MLB'
          api_url = "https://collinapi.onrender.com/mlbheadshot/#{player_name}" # Your API URL
        else
          api_url = "https://collinapi.onrender.com/milbheadshot/#{player_name}" # Your API URL
          @other = Profile.find_by(player_name: player.name)
          @other = Profile.find_by(player_name: @other.reference_player)
          @hitter = Score.find_by(player_name: player.name)
          @hitter = Score.find_by(player_name: @hitter.reference_player)
          other_name = @other.player_name.strip.gsub(' ', '_')
          other_name2 = @hitter.player_name.strip.gsub(' ', '_')
        end
      end
      begin
        # Fetch data from the API
        response = Net::HTTP.get_response(URI(api_url))

        if response.is_a?(Net::HTTPSuccess)
          @player_name = params[:player_name]
          @other_name = @other.player_name
          @other_name2 = @hitter.player_name
          @other_player_name_2 = @other.player_name
          @other_player_name = @hitter.player_name
          @headshot_url = api_url # Assuming the API returns a 'headshot_url' field
          @player_stats =  default_stats(params[:player_name]) # Fetch stats or use default
          @other_player_stats = default_stats(@hitter.player_name)
          @player_profile = profile_nums(params[:player_name])
          @other_player_profile = profile_nums(@other.player_name)
          @other_headshot_url_2 = "https://collinapi.onrender.com/mlbheadshot/#{other_name}"
          @player_distribution = hit_distribution(params[:player_name])
          @other_distribution = hit_distribution(@other.player_name)
          @other_headshot_url = "https://collinapi.onrender.com/mlbheadshot/#{other_name2}"

        else
          @error = "Headshot not found for #{api_url}."
          @player_stats = default_stats(player_name) # Use default stats if headshot is not found
        end
      rescue StandardError => e
        @error = "Failed to fetch data: #{e.message}"
        @player_stats = default_stats(player_name) # Use default stats if there's an error
      end
    end
  end

  private

  # Default stats if no stats are returned from the API
  def default_stats(player_name)
    player = Score.find_by(player_name: player_name)
    @testing = player_name
    if player.present?
      [player.iso, player.spd, player.woba, player.wrc_plus, player.obp]
    else
      [0.0, 0.0, 0.0, 20.0, 0.0] # Default to zeros if player is
    end
  end

  

  def profile_nums(player_name)
    player = Profile.find_by(player_name: player_name)
    
    if player.present?
      [  0,player.hr,0, player.iffb,0,player.pull, player.center, player.oppo]
    else
      [20, 20, 20, 20, 20, 20, 20, 20] # Default to zeros if player is not found
    end
  end

  def hit_distribution(name)
    player = Profile.find_by(player_name: name)
    if player.present?
      [player.fb, player.ld, player.gb]
    else
      [0, 0, 0]
    end
  end
end