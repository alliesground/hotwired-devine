require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:project) { create(:project) }
  let(:params) { attributes_for(:task) }
  let(:task) { create(:task) }

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

  describe "DELETE /destroy" do
    subject(:subject_destroy) {
      delete task_path(task)
    }

    before { task }

    it "deletes a task" do
      expect{
        subject_destroy
      }.to change(Task, :count).by (-1)
    end
  end

  describe "PUT /complete" do
    context "when task is marked as complete" do
      let(:subject_complete) {
        put complete_task_path(task), params: { task: {complete: "1"} }
      }

      before { task }

      it "marks a task complete as true" do
        subject_complete
        expect(task.reload.complete).to be true
      end
    end

    context "when task is marked as incomplete" do
      let(:subject_complete) {
        put complete_task_path(task), params: { task: {complete: "0"} }
      }

      before { task }

      it "marks a task complete as false" do
        subject_complete
        expect(task.reload.complete).to be false
      end
    end
  end
end
