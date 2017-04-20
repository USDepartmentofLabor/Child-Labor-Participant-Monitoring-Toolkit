require 'rails_helper'
require 'spec_helper'

describe TargetsController do
  login_user

  before do
    @indicator = create(:indicator)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, :indicator_id => @indicator.id
      expect(response).to have_http_status(:success)
    end
  end

end
