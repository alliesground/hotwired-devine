require 'rails_helper'

RSpec.describe "/projects", type: :request do
  let(:valid_attributes) {
    attributes_for :project
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_project_url
      expect(response).to be_successful
    end
  end

  describe "POST /projects" do
    subject(:subject_create) {
      post projects_url, params: { project: valid_attributes }
    }

    context "with valid parameters" do
      it "create a new Project" do
        expect { subject_create }.
          to change(Project, :count).by(1)
      end

      it "redirects to the projects list page" do
        subject_create
        expect(response).to redirect_to projects_url
      end
    end
  end
end
