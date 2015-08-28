require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  describe "POST #create" do
    it "create project" do
      expect {
        post :create, {project: attributes_for(:project)}
      }.to change(Project, :count).by(1)
    end
  end
end