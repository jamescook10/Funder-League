require 'spec_helper'

describe LeaguesController do
  describe "GET #index" do
    it "renders the League index" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do

    context "for FIFA" do
      it "renders the FIFA league" do
        get :show, name: "FIFA"
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end
    
    context "for Table Tennis" do
      it "renders the Table Tennis league" do
        get :show, name: "Table Tennis"
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end

    context "for Table Football" do
      it "renders the Table Football league" do
        get :show, name: "Table Football"
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end

    context "for Pool" do
      it "renders the Pool league" do
        get :show, name: "Pool"
        assigns(:game_type)
        expect(response).to render_template :show
      end
    end
  end
end
