class Game < ActiveRecord::Base
  attr_accessor :player_id, :opponent_id
  attr_writer :player_score, :opponent_score

  belongs_to :game_type
  has_many :scores
  has_many :players, through: :scores
  belongs_to :winner, class_name: "Player"

  before_save :calculate_winner
  before_create :create_scores

  validates :game_type_id, presence: true
  validates :player_id, presence: true
  validates :player_score, presence: true
  validates :opponent_id, presence: true
  validates :opponent_score, presence: true

  def player_score
    if self.new_record?
      @player_score
    else
      self.scores.where(player_id: @player_id).first.value
    end
  end

  def opponent_score
    if self.new_record?
      @opponent_score
    else
      self.scores.where.not(player_id: @player_id).first.value
    end
  end

  def calculate_winner
    if @player_score == @opponent_score
      self.winner_id = nil
    elsif @player_score > @opponent_score
      self.winner_id = @player_id
    else
      self.winner_id = @opponent_id
    end
  end

  def create_scores
    self.scores.build(value: @player_score, player_id: @player_id)
    self.scores.build(value: @opponent_score, player_id: @opponent_id)
  end

  def scores_for(player)
    scores.ordered_for_player(player)
  end

end
