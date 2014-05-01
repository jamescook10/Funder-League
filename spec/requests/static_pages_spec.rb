require 'spec_helper'

describe "Static pages" do

	describe "GET 'rules'" do
	    it "returns http success" do
	      get 'rules'
	      response.should be_success
	    end
	  end

	 describe "GET 'FAQ'" do
	    it "returns http success" do
	      get 'faq'
	      response.should be_success
	    end
	  end

end