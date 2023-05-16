require 'todo_list'

RSpec.describe TodoList do
  let(:todo_list) { TodoList.new }

  context "#view_tasks method" do
    it "returns an empty array when there are no tasks" do
      expect(todo_list.view_tasks).to eq []
    end
  end
end
