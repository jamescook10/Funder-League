require 'spec_helper'

describe GamesController do

  let(:fifa) { create(:game_type) }
  let(:sam) { create(:player) }
  let(:james) { create(:opponent) }
  let(:valid_params) { { game: { game_type_id: fifa.id, player_score: 1, opponent_score: 2, opponent_id: james.id } } }
  let(:invalid_params) { { game: { game_type_id: nil, player_score: 1, opponent_score: 2, opponent_id: james.id } } }
  
  describe "GET '#index'" do
    it "renders the 'My Games' page" do
      sign_in sam
      get :index
      expect(response).to render_template :index
    end
  end

  describe "#create" do

    context "when a player is signed in" do

      before(:each) do
        sign_in sam
      end
      
      it "creates a new game" do
        post :create, valid_params
        expect(Game.count).to eq 1
      end

      context "and a game is created successfully" do
        it "redirects to the dashboard" do
          post :create, valid_params
          expect(response).to redirect_to dashboard_path
        end
      end

      context "and there are errors when trying to create a game" do
        it "renders the dashboard" do
          post :create, invalid_params
          expect(response).to render_template "dashboard/index"
        end
      end      
    end

    context "when a player isn't signed in" do  
      it "redirects to the login page" do
        post :create, valid_params
        expect(response).to redirect_to new_player_session_path
      end
    end
  end
end