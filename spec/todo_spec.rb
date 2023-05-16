require 'todo'

RSpec.describe Todo do
  let(:task) { "Buy groceries" }
  let(:todo) { Todo.new(task) }

  describe "#mark_done!" do
    it "marks the task as done" do
      expect(todo.done?).to be false
      todo.mark_done!
      expect(todo.done?).to be true
    end
  end
end
