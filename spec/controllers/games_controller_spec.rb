require 'spec_helper'

describe GamesController do

  let(:fifa) { create(:game_type) }
  let(:player) { create(:player) }
  let(:opponent) { create(:player) }
  let(:valid_params) { { game: { game_type_id: fifa.id, player_score: 1, opponent_score: 2, opponent_id: opponent.id } } }
  let(:invalid_params) { { game: { game_type_id: nil, player_score: 1, opponent_score: 2, opponent_id: opponent.id } } }
  
  describe "GET '#index'" do
    it "renders the 'My Games' page" do
      sign_in player
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do

    context "when a player is signed in" do

      before(:each) do
        sign_in player
      end
      
      it "creates a new game" do
        post :create, valid_params
        expect(Game.count).to eq 1
      end

      context "and a game is created successfully" do
        it "redirects to show the new game" do
          post :create, valid_params
          expect(response).to redirect_to my_games_path
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

  describe 'GET #edit' do

    let!(:other_player) { create(:player) }
    let!(:game) { create(:game, player_id: player.id, opponent_id: opponent.id) }

    context 'when a player who played the specified game is signed in' do
      it 'renders the Edit Game page' do
        sign_in player
        get :edit, id: game.id
        expect(response).to render_template :edit
      end
    end

    context 'when a player who didn\'t play the specified game is signed in' do
      it 'renders the My Games page' do
        sign_in other_player
        get :edit, id: game.id
        expect(response).to redirect_to my_games_path
      end
    end

    context 'when nobody is signed in' do
      it 'redirects to the login page' do
        get :edit, id: game.id
        expect(response).to redirect_to new_player_session_path
      end
    end
  end

  describe 'PUT #update' do

    let!(:game) { create(:game, player_id: player.id, opponent_id: opponent.id) }
    let!(:other_player) { create(:player) }

    context 'when a player is updating their own game' do
      it 'updates a game' do
        sign_in player
        put :update, { game: { game_type_id: fifa.id, player_score: 3, opponent_score: 1, player_id: player.id, opponent_id: opponent.id }, id: game.id }
        expect(response).to redirect_to my_games_path
      end
    end

    context 'when a player attempts to update a game they haven\'t played' do

      it 'renders the edit form' do
        sign_in other_player
        put :update, { game: { game_type_id: fifa.id, player_score: 3, opponent_score: 1, player_id: player.id, opponent_id: opponent.id }, id: game.id }
        expect(response).to redirect_to my_games_path
      end
    end
  end
end