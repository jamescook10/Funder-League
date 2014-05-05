class Game < ActiveRecord::Base
  attr_accessor :player_id, :opponent_id
  attr_writer :player_score, :opponent_score

  belongs_to :game_type
  has_many :scores
  before_save :calculate_winner
  before_create :create_scores

  validates :game_type_id, presence: true
  validates :player_id, presence: true
  validates :player_score, presence: true
  validates :opponent_id, presence: true
  validates :opponent_score, presence: true

  def player_score
    @player_score || self.scores.where("player_id = #{@player_id}").value
  rescue NoMethodError
    errors.add :player_score, "does not exist for this player."
  end

  def opponent_score
    @opponent_score || self.scores.where.not("player_id = #{@player_id}").value
  rescue NoMethodError
    errors.add :opponent_score, "does not exist for this opponent."
  end

  def calculate_winner
    if @player_score == @opponent_score
      self.winner_id = 0
    elsif @player_score > @opponent_score
      self.winner_id = @player_id
    else
      self.winner_id = @opponent_id
    end
  end

  def winner
    Player.find(winner_id)
  end

  def create_scores
    self.scores.build(value: @player_score, player_id: @player_id)
    self.scores.build(value: @opponent_score, player_id: @opponent_id)
  end

end
