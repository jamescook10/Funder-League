class Game < ActiveRecord::Base
  attr_accessor :player_score, :player_id, :opponent_score, :opponent_id

  belongs_to :game_type
  before_create :calculate_winner

  validates :game_type_id, presence: true
  validates :player_id, presence: true
  validates :player_score, presence: true
  validates :opponent_id, presence: true
  validates :opponent_score, presence: true

  def calculate_winner
    if @player_score == @opponent_score
      self.winner_id = 0
    elsif @player_score > @opponent_score
      self.winner_id = @player_id
    else
      self.winner_id = @opponent_id
    end
  end

end
