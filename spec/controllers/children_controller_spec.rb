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

  describe "GET #show" do
    it "assigns the requested child as @child" do
      project = create(:project_with_children, num_child: 3, user_id: user.id)
      child = project.children.first
      get :show, {:id => child.to_param, project_id: project.id}
      expect(assigns(:child)).to eq(child)
    end

    it "shows child with custom fields" do
      project = create(:project_with_children, num_child: 3, user_id: user.id)
      custom_fields = create_list(:custom_field, 3, project_id: project.id, model_type: "Child")
      child = project.children.first

      get :show, {:id => child.to_param, project_id: project.id}
      expect(assigns(:custom_fields).map { |e| e.id }).to eq(custom_fields.map { |e| e.id })
    end
  end

  describe "GET #new" do
    it "assigns a new child as @child" do
      project = create(:project, user_id: user.id)
      get :new, {project_id: project.id}
      expect(assigns(:child)).to be_a_new(Child)
    end
  end

  describe "GET #edit" do
    it "assigns the requested child as @child" do
      project = create(:project_with_children, num_child: 3, user_id: user.id)
      custom_fields = create_list(:custom_field, 3, project_id: project.id, model_type: "Child")
      child = project.children.first

      get :edit, {:id => child.to_param, project_id: project.id}
      expect(assigns(:custom_fields).map { |e| e.id }).to eq(custom_fields.map { |e| e.id })
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Child under a project" do
        project = create(:project, user_id: user.id)
        expect {
          post :create, {child: attributes_for(:child), project_id: project.id}
        }.to change(Child, :count).by(1)

        project_child = ProjectsChild.last

        expect(project_child.project_id).to eq(project.id)

        expect(response).to redirect_to(project_child_path(project.id, project_child.child_id))
      end

      # it "assigns a newly created child as @child" do
      #   post :create, {:child => valid_attributes}, valid_session
      #   expect(assigns(:child)).to be_a(Child)
      #   expect(assigns(:child)).to be_persisted
      # end

      # it "redirects to the created child" do
      #   post :create, {:child => valid_attributes}, valid_session
      #   expect(response).to redirect_to(Child.last)
      # end
    end

    # context "with invalid params" do
    #   it "assigns a newly created but unsaved child as @child" do
    #     post :create, {:child => invalid_attributes}, valid_session
    #     expect(assigns(:child)).to be_a_new(Child)
    #   end

    #   it "re-renders the 'new' template" do
    #     post :create, {:child => invalid_attributes}, valid_session
    #     expect(response).to render_template("new")
    #   end
    # end
  end

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
