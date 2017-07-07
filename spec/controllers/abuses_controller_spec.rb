require 'rails_helper'
require 'spec_helper'
require 'pp'

RSpec.describe AbusesController, type: :controller do
  login_user

  before do
    @abuse = create(:abuse)
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new abuse" do
        expect {
          post :create, {abuse: attributes_for(:abuse)}
        }.to change(Abuse, :count).by(1)

        expect(response).to redirect_to(status_config_project_path)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested abuse" do
        put :update, {:id => @abuse.to_param,
                      abuse: attributes_for(:abuse, display_name: "new abuse name")}
        expect(Abuse.find(@abuse.id).display_name).to eq("new abuse name")
      end

      it "assigns the requested abuse as @abuse" do
        put :update, {:id => @abuse.to_param,
                      abuse: attributes_for(:abuse)}
        expect(assigns(:abuse)).to eq(@abuse)
      end

      it "redirects to the abuse" do
        put :update, {:id => @abuse.to_param,
                      abuse: attributes_for(:abuse)}
        expect(response).to redirect_to(status_config_project_path)
      end
    end

    context "with invalid params" do
      it "assigns the abuse as @abuse" do
        put :update, {:id => @abuse.to_param,
                      abuse: attributes_for(:abuse, display_name: nil)}
        expect(assigns(:abuse)).to eq(@abuse)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @abuse.to_param,
                      abuse: attributes_for(:abuse, display_name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested abuse" do
      expect {
        delete :destroy, {:id => @abuse.to_param}
      }.to change(Abuse, :count).by(-1)
    end

    it "redirects to the status config page" do
      delete :destroy, {:id => @abuse.to_param}
      expect(response).to redirect_to(status_config_project_path)
    end
  end

end
