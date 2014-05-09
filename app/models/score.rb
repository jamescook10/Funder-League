class Score < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  validates :player_id, presence: true
  validates :game_id, presence: true
  validates :value, presence: true

  def self.ordered_for_player(player)
    order(sanitize_sql(["player_id=? DESC", player.id]))
  end

end
