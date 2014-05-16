class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  validates :first_name, presence: true

  has_many :scores
  has_many :games, through: :scores
  has_many :game_types, -> { uniq }, through: :games

  def full_name
    if self.first_name && self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end

  def possessive_form(name)
    if name[-1] == "s"
      name + "'"
    else
      name + "'s"
    end
  end

  def win_percentage_for(game_type)
    games = self.games.where(game_type: game_type).count.to_f
    wins = self.games.where(winner: self).where(game_type: game_type).count
    if wins == 0
      0
    else
      (wins / games) * 100
    end
  end

  def count_games_for(game_type)
    games.where(game_type: game_type).count
  end

  def count_wins_for(game_type)
    games.where(winner: self, game_type:game_type).count
  end

  def count_draws_for(game_type)
    games.where(winner_id: nil, game_type:game_type).count
  end

  def count_losses_for(game_type)
    games.where(game_type:game_type).where.not(winner: self).where.not(winner_id: nil).count
  end

  def league_position_for(game_type)
    players = game_type.players
    if players.include?(self)
      players.sort { |a,b| b.win_percentage_for(game_type) <=> a.win_percentage_for(game_type) }.index(self) + 1
    else
      nil
    end
  end
end
