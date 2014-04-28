require 'spec_helper'

describe GamesController do

  let(:fifa) { create(:game_type) }
  
  describe "#create" do
    
    it "creates a new game" do
      post :create, { game: { game_type_id: fifa.id, player_score: 1, opponent_score: 2, opponent_id: 2 } }
      expect(Game.count).to eq 1
    end

    it "renders the dashboard" do
      post :create, { game: { game_type_id: fifa.id, player_score: 1, opponent_score: 2, opponent_id: 2 } }
      expect(response).to render_template "dashboard/show"
    end
  end

end