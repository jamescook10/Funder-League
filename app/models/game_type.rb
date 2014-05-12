class GameType < ActiveRecord::Base
  has_many :games
  has_many :players, -> { uniq }, through: :games

end
