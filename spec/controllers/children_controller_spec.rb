require 'rails_helper'

RSpec.describe ChildrenController, type: :controller do

  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "GET #index" do
    it "assigns all children within the same project as @children" do
      project1 = create(:project_with_children, num_child: 3, user_id: user.id)
      project2 = create(:project_with_children, num_child: 5, user_id: user.id)
      get :index, {"project_id" => project1.id}
      expect(assigns(:children).length).to eq(3)
    end
  end

  # describe "GET #show" do
  #   it "assigns the requested child as @child" do
  #     child = Child.create! valid_attributes
  #     get :show, {:id => child.to_param}, valid_session
  #     expect(assigns(:child)).to eq(child)
  #   end
  # end

  # describe "GET #new" do
  #   it "assigns a new child as @child" do
  #     get :new, {}, valid_session
  #     expect(assigns(:child)).to be_a_new(Child)
  #   end
  # end

  # describe "GET #edit" do
  #   it "assigns the requested child as @child" do
  #     child = Child.create! valid_attributes
  #     get :edit, {:id => child.to_param}, valid_session
  #     expect(assigns(:child)).to eq(child)
  #   end
  # end

  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new Child" do
  #       expect {
  #         post :create, {:child => valid_attributes}, valid_session
  #       }.to change(Child, :count).by(1)
  #     end

  #     it "assigns a newly created child as @child" do
  #       post :create, {:child => valid_attributes}, valid_session
  #       expect(assigns(:child)).to be_a(Child)
  #       expect(assigns(:child)).to be_persisted
  #     end

  #     it "redirects to the created child" do
  #       post :create, {:child => valid_attributes}, valid_session
  #       expect(response).to redirect_to(Child.last)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved child as @child" do
  #       post :create, {:child => invalid_attributes}, valid_session
  #       expect(assigns(:child)).to be_a_new(Child)
  #     end

  #     it "re-renders the 'new' template" do
  #       post :create, {:child => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested child" do
  #       child = Child.create! valid_attributes
  #       put :update, {:id => child.to_param, :child => new_attributes}, valid_session
  #       child.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "assigns the requested child as @child" do
  #       child = Child.create! valid_attributes
  #       put :update, {:id => child.to_param, :child => valid_attributes}, valid_session
  #       expect(assigns(:child)).to eq(child)
  #     end

  #     it "redirects to the child" do
  #       child = Child.create! valid_attributes
  #       put :update, {:id => child.to_param, :child => valid_attributes}, valid_session
  #       expect(response).to redirect_to(child)
  #     end
  #   end

  #   context "with invalid params" do
  #     it "assigns the child as @child" do
  #       child = Child.create! valid_attributes
  #       put :update, {:id => child.to_param, :child => invalid_attributes}, valid_session
  #       expect(assigns(:child)).to eq(child)
  #     end

  #     it "re-renders the 'edit' template" do
  #       child = Child.create! valid_attributes
  #       put :update, {:id => child.to_param, :child => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   it "destroys the requested child" do
  #     child = Child.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => child.to_param}, valid_session
  #     }.to change(Child, :count).by(-1)
  #   end

  #   it "redirects to the children list" do
  #     child = Child.create! valid_attributes
  #     delete :destroy, {:id => child.to_param}, valid_session
  #     expect(response).to redirect_to(children_url)
  #   end
  # end

end
