require 'rails_helper'
require 'spec_helper'
require 'pp'

describe AdultsController do
  login_user

  before do
    @adult = create(:adult)
  end

  describe "GET #show" do
    it "assigns the requested adult as @adult" do
      get :show, {:id => @adult.to_param, :household_id => @adult.household_id}
      expect(assigns(:adult)).to eq(@adult)
    end

    it "renders the show template" do
      get :show, {:id => @adult.to_param, :household_id => @adult.household_id}
      expect(response).to render_template("show")
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested adult" do
        put :update, {:id => @adult.to_param, :household_id => @adult.household_id,
                      adult: attributes_for(:adult, first_name: "new adult name")}
        expect(Adult.find(@adult.id).first_name).to eq("new adult name")
      end

      it "assigns the requested adult as @adult" do
        put :update, {:id => @adult.to_param, :household_id => @adult.household_id,
                      adult: attributes_for(:adult)}
        expect(assigns(:adult)).to eq(@adult)
      end

      it "redirects to the adult" do
        put :update, {:id => @adult.to_param, :household_id => @adult.household_id,
                      adult: attributes_for(:adult)}
        expect(response).to redirect_to(household_url(@adult.household_id))
      end
    end

    context "with invalid params" do
      it "assigns the adult as @adult" do
        put :update, {:id => @adult.to_param, :household_id => @adult.household_id,
                      adult: attributes_for(:adult, first_name: nil)}
        expect(assigns(:adult)).to eq(@adult)
      end

      it "re-renders the 'show' template" do
        put :update, {:id => @adult.to_param, :household_id => @adult.household_id,
                      adult: attributes_for(:adult, first_name: nil)}
        expect(response).to render_template("show")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested adult" do
      expect {
        delete :destroy, {:id => @adult.to_param, :household_id => @adult.household_id}
      }.to change(Adult, :count).by(-1)
    end

    it "redirects to the adult's household" do
      hh = @adult.household
      delete :destroy, {:id => @adult.to_param, :household_id => @adult.household_id}
      expect(response).to redirect_to(household_url(hh))
    end
  end
end
