class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  def self.ordered_for_player(player)
    order(sanitize_sql(["player_id=? DESC", player.id]))
  end

end
