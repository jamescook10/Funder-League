module DashboardHelper
  def format_league_position(position)
    position = position.to_s unless position.nil?
    if position.nil?
      "You haven't played any games in this league yet!"
    elsif position [-1] == "0" || position[-1] == "4" || position[-1] == "5" || position[-1] == "6" || position[-1] == "7" || position[-1] == "8" || position[-1] == "9" || position == "11"
      position + "th"
    elsif position[-1] == "1" && position != "11"
      position + "st"
    elsif position[-1] == "2"
      position + "nd"
    elsif position[-1] == "3"
      position + "rd"
    end
  end
end
