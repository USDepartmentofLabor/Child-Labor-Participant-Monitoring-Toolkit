require 'rails_helper'
require 'spec_helper'

describe TranslationsController do
  login_user

  before do
    @locale = create(:locale)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, :locale_id => @locale.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, :locale_id => @locale.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "returns http success" do
      post :create, :locale_id => @locale.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, :locale_id => @locale.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update, :locale_id => @locale.id
      expect(response).to have_http_status(:success)
    end
  end

end
