require 'spec_helper'

describe DashboardController do

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

  describe "#show" do
    it 'redirects to a login page if there is no player signed in' do
      get :show
      expect(response).to redirect_to new_player_session_path
    end

    it 'renders the players dashboard if player is signed in' do
      sign_in create(:player)
      get :show
      expect(response).to render_template :show
    end
  end

end
