class GameType < ActiveRecord::Base
  has_many :games
  has_many :players, -> { uniq }, through: :games

  def to_param
    name
  end

  def sort_players_by_win_percentage
    self.players.sort do |a,b|
      b.win_percentage_for(self) <=> a.win_percentage_for(self)
    end
  end

end
