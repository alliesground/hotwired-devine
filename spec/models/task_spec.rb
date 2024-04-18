require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  describe "scopes" do
    describe "completed" do
      before do
        task.update_columns(complete: true)
      end

      it "returns completed tasks" do
        expect(described_class.completed).to eq [task]
      end
    end
  end
end
