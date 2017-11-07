require 'rails_helper'
require 'spec_helper'
require 'pp'

describe RelationshipsController do
  login_user

  before do
    @relationship = create(:relationship)
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new relationship" do
        expect {
          post :create, {relationship: attributes_for(:relationship)}
        }.to change(Relationship, :count).by(1)

        expect(response).to redirect_to(relationships_path)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested relationship" do
        put :update, {:id => @relationship.to_param,
                      relationship: attributes_for(:relationship, display_name: "new relationship name")}
        expect(Relationship.find(@relationship.id).display_name).to eq("new relationship name")
      end

      it "assigns the requested relationship as @relationship" do
        put :update, {:id => @relationship.to_param,
                      relationship: attributes_for(:relationship)}
        expect(assigns(:relationship)).to eq(@relationship)
      end

      it "redirects to the list of relationships" do
        put :update, {:id => @relationship.to_param,
                      relationship: attributes_for(:relationship)}
        expect(response).to redirect_to(relationships_path)
      end
    end

    context "with invalid params" do
      it "assigns the relationship as @relationship" do
        put :update, {:id => @relationship.to_param,
                      relationship: attributes_for(:relationship, display_name: nil)}
        expect(assigns(:relationship)).to eq(@relationship)
      end

      it "re-renders the 'edit' template" do
        put :update, {:id => @relationship.to_param,
                      relationship: attributes_for(:relationship, display_name: nil)}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested relationship" do
      expect {
        delete :destroy, {:id => @relationship.to_param}
      }.to change(Relationship, :count).by(-1)
    end

    it "redirects to the relationship list" do
      delete :destroy, {:id => @relationship.to_param}
      expect(response).to redirect_to(relationships_url)
    end
  end
end
