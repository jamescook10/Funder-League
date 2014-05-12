class GameType < ActiveRecord::Base
  has_many :games
  has_many :players, -> { uniq }, through: :games

  def to_param
    name
  end

end
