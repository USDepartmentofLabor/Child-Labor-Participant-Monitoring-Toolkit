require 'rails_helper'

RSpec.describe HouseholdsController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "assigns all households as @households" do
      household = FactoryGirl.create(:household)
      get :index, {}
      expect(assigns(:households)).to eq([household])
    end
  end

  describe "GET #show" do
    it "assigns the requested household as @household" do
      household = FactoryGirl.create(:household)
      get :show, {:id => household.to_param}
      expect(assigns(:household)).to eq(household)
    end
  end

  describe "GET #new" do
    it "assigns a new household as @household" do
      get :new, {}
      expect(assigns(:household)).to be_a_new(Household)
    end
  end

  describe "GET #edit" do
    it "assigns the requested household as @household" do
      household = FactoryGirl.create(:household)
      get :edit, {:id => household.to_param}
      expect(assigns(:household)).to eq(household)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Household" do
        expect {
          post :create, { household: attributes_for(:household) }
        }.to change(Household, :count).by(1)
      end

      it "assigns a newly created household as @household" do
        post :create, { household: attributes_for(:household) }
        expect(assigns(:household)).to be_a(Household)
        expect(assigns(:household)).to be_persisted
      end

      it "redirects to the created household" do
        post :create, { household: attributes_for(:household) }
        expect(response).to redirect_to(Household.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved household as @household" do
        post :create, { household: attributes_for(:household, name: nil) }
        expect(assigns(:household)).to be_a_new(Household)
      end

      it "re-renders the 'new' template" do
        post :create, { household: attributes_for(:household, name: nil) }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do

    context "with valid params" do
      it "updates the requested household" do
        household = FactoryGirl.create(:household)
        put :update, {:id => household.to_param, household: attributes_for(:household, name: "new household name" )}
        household.reload
        expect(Household.find(household.id).name).to eq("new household name")
      end

      it "assigns the requested household as @household" do
        household = FactoryGirl.create(:household)
        put :update, {:id => household.to_param, household: attributes_for(:household)}
        expect(assigns(:household)).to eq(household)
      end

      it "redirects to the household" do
        household = FactoryGirl.create(:household)
        put :update, {:id => household.to_param, household: attributes_for(:household)}
        expect(response).to redirect_to(household)
      end
    end

    context "with invalid params" do
      it "assigns the household as @household" do
        household = FactoryGirl.create(:household)
        put :update, {:id => household.to_param, household: attributes_for(:household, name: nil)}
        expect(assigns(:household)).to eq(household)
      end

      it "re-renders the 'edit' template" do
        household = FactoryGirl.create(:household)
        put :update, {:id => household.to_param, household: attributes_for(:household, name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested household" do
      household = FactoryGirl.create(:household)
      expect {
        delete :destroy, {:id => household.to_param}
      }.to change(Household, :count).by(-1)
    end

    it "redirects to the households list" do
      household = FactoryGirl.create(:household)
      delete :destroy, {:id => household.to_param}
      expect(response).to redirect_to(households_url)
    end

  end

end
