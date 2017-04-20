require 'rails_helper'
require 'spec_helper'

describe TranslationsController do
  login_user

  before do
    @locale = create(:locale)
    @translation = create(:translation, locale: @locale)
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
    it "creates a new translation" do
      expect {
        post :create, :locale_id => @locale.id,
          :i18n_backend_active_record_translation =>
            attributes_for(:translation)
      }.to change(Translation, :count).by(1)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, :locale_id => @locale.id, :id => @translation.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "returns http success" do
      put :update, :locale_id => @locale.id, :id => @translation.id,
        :i18n_backend_active_record_translation => {
          :key => 'key.key',
          :value => 'value'
        }
      expect(response).to redirect_to(locale_translations_url(@locale))
    end
  end

end
