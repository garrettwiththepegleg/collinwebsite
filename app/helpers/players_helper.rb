# app/helpers/players_helper.rb
module PlayersHelper
    def percentage_to_color(percentage)
      # Map percentage to a color from red to green
      red = (255 * (100 - percentage) / 100).to_i
      green = (255 * percentage / 100).to_i
      blue = 0
  
      "rgb(#{red},#{green},#{blue})"
    end
  end