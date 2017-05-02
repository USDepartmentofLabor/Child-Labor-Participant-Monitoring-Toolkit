require 'rails_helper'
require 'spec_helper'

describe ChildrenController do
  login_user

  before do
    @child = create(:child, :is_beneficiary => true)
  end

  let(:invalid_attributes) {{
    :last_name => nil
  }}

  describe "GET #index" do
    it "assigns all children who are beneficiaries as @children" do
      get :index
      expect(assigns(:children)).to eq([@child])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested child as @child" do
      get :show, {:id => @child.to_param}
      expect(assigns(:child)).to eq(@child)
    end

    it "includes custom fields" do
      custom_fields = create_list(:custom_field, 3, model_type: "Child", custom_section_id: 1)

      get :show, {:id => @child.to_param}
      expect(assigns(:custom_fields).map { |e| e.id }).to eq(custom_fields.map { |e| e.id })
    end
  end

  describe "GET #new" do
    it "assigns a new child as @child" do
      get :new
      expect(assigns(:child)).to be_a_new(Child)
    end
  end

  describe "GET #edit" do
    it "assigns the requested child as @child" do
      get :edit, {:id => @child.to_param}
      expect(assigns(:child)).to eq(@child)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new child" do
        expect {
          post :create, {child: attributes_for(:child)}
        }.to change(Child, :count).by(1)

        expect(response).to redirect_to(new_child_path)
      end

      it "creates custom field values" do
        create(:custom_field, model_type: 'Child', id: 1)
        expect {
          post :create, {child: attributes_for(:child),
                         custom_fields: {"1": {value_text: 'foo'}}}
        }.to change(CustomValue, :count).by(1)
      end

      it "assigns a newly created child as @child" do
        post :create, {child: attributes_for(:child)}
        expect(assigns(:child)).to be_a(Child)
        expect(assigns(:child)).to be_persisted
      end

      it "redirects to the new child form" do
        post :create, {child: attributes_for(:child)}
        expect(response).to redirect_to(new_child_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved child as @child" do
        post :create, {:child => invalid_attributes}
        expect(assigns(:child)).to be_a_new(Child)
      end

      it "re-renders the 'new' template" do
        post :create, {:child => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) do
        { :fname => 'Foo',
          :lname => 'Bar'
        }
      end

      it "updates the requested child" do
        child = create(:child)
        put :update, {:id => child.to_param, :child => new_attributes}
        child.reload
        expect(assigns(:child)).to eq(child)
      end

      it "assigns the requested child as @child" do
        child = create(:child)
        put :update, {:id => child.to_param, :child => new_attributes}
        expect(assigns(:child)).to eq(child)
      end

      it "redirects to the child" do
        child = create(:child)
        put :update, {:id => child.to_param, :child => new_attributes}
        expect(response).to redirect_to(child)
      end
    end

    context "with invalid params" do
      it "assigns the child as @child" do
        child = create(:child)
        put :update, {:id => child.to_param, :child => invalid_attributes}
        expect(assigns(:child)).to eq(child)
      end

      it "re-renders the 'edit' template" do
        child = create(:child)
        put :update, {:id => child.to_param, :child => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested child" do
      child = create(:child)
      expect {
        delete :destroy, {:id => child.to_param}
      }.to change(Child, :count).by(-1)
    end

    it "redirects to the children list" do
      child = create(:child)
      delete :destroy, {:id => child.to_param}
      expect(response).to redirect_to(children_url)
    end
  end

end
