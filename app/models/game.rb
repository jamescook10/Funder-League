class Game < ActiveRecord::Base
  belongs_to :game_type
  before_validation :calculate_winner

  attr_accessor :player_score, :opponent_score, :opponent_id

  validates :winner_id, presence: true

  def calculate_winner
    if @player_score == @opponent_score
      self.winner_id = 0
    elsif @player_score > @opponent_score
      self.winner_id = @player_score
    else
      self.winner_id = @opponent_score
    end

  end
end
