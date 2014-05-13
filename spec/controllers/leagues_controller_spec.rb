require 'spec_helper'

describe LeaguesController do
  describe "GET #index" do
    it "renders the League index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do

    let(:fifa) { create(:game_type, name: "FIFA") }
    let(:table_tennis) { create(:game_type, name: "Table Tennis") }
    let(:table_football) { create(:game_type, name: "Table Football") }
    let(:pool) { create(:game_type, name: "Pool") }

    context "for FIFA" do
      it "renders the FIFA league" do
        get :show, name: fifa.name
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end
    
    context "for Table Tennis" do
      it "renders the Table Tennis league" do
        get :show, name: table_tennis.name
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end

    context "for Table Football" do
      it "renders the Table Football league" do
        get :show, name: table_tennis.name
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end

    context "for Pool" do
      it "renders the Pool league" do
        get :show, name: pool.name
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end
  end

  describe "#sort_by_win_percentage" do
    
    let(:fifa) { double("FIFA", name: "FIFA") }
    let(:player1) { double("Player 1", win_percentage_for: 10.0) }
    let(:player2) { double("Player 2", win_percentage_for: 50.0) }
    let(:player3) { double("Player 3", win_percentage_for: 30.0) }
    let(:player_array) { [player1, player2, player3] } 

    it "sorts an array of players based on their win percentage" do
      expect(subject.sort_by_win_percentage(player_array, fifa)).to eq [player2, player3, player1]
    end
  end
end
