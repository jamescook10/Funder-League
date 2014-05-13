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
end
