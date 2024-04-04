require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:project) { create(:project) }
  let(:params) { attributes_for(:task) }

  describe "POST /create" do
    subject(:subject_create) {
      post project_tasks_url(project), params: { task: params }
    }

    it "returns http success" do
      subject_create
      expect(response).to redirect_to project_path(project)
    end

    it "creates a new task" do
      expect{
        subject_create
      }.to change(Task, :count).by 1
    end
  end

end
