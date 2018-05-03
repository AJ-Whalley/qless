require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #how_it_works" do
    it "returns http success" do
      get :how_it_works
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #support" do
    it "returns http success" do
      get :support
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_home" do
    it "returns http success" do
      get :user_home
      expect(response).to have_http_status(:success)
    end
  end

end
