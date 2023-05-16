require 'diary'
require 'diary_entry'
require 'contact'
require 'contact_list'
require 'todo_list'
require 'todo'

RSpec.describe "Diary Integration" do
  let(:diary) { Diary.new }
  let(:entry_1) { DiaryEntry.new("2023-05-01", "Today was a great day!") }
  let(:entry_2) { DiaryEntry.new("2023-05-02", "Feeling tired, need some rest.") }
  let(:entry_3) { DiaryEntry.new("2023-05-03", "Started a new project.", [Contact.new("John Doe", "1234567890")]) }
  let(:entry_4) { DiaryEntry.new("2023-05-04", "Met Jane Smith.", [Contact.new("Jane Smith", "9876543210")]) }
  let(:todo_1) { Todo.new("Buy groceries") }
  let(:todo_2) { Todo.new("Clean the house") }
  let(:todo_3) { Todo.new("Pay bills") }
  let(:todo_list) { TodoList.new }

  context "#list method" do
    it "returns list of entries" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.list).to eq [entry_1, entry_2]
    end
  end

  context "#count_words method" do
    it "returns the total number of words in the diary" do
      diary.add(entry_1)
      expect(diary.count_words).to eq 5
    end

    it "returns the total number of words in the diary" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 10
    end
  end

  context "#select_entries method" do
    it "returns an entry that can be read within the given time" do
      diary.add(entry_1)
      diary.add(entry_4)
      expect(diary.select_entries(3, 1)).to eq entry_4
    end

    it "returns an entry that can be read within the given time" do
      diary.add(entry_1)
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.select_entries(2, 2)).to eq entry_3
    end
  end

  context "#find_phone_numbers method" do
    it "returns all contact phone numbers in the diary" do
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.find_phone_numbers).to eq ["1234567890", "9876543210"]
    end

    it "returns an empty array when no contacts exist" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.find_phone_numbers).to eq []
    end
  end

  context "TodoList integration" do
    it "adds and views tasks" do
      todo_list.add_task(todo_1)
      todo_list.add_task(todo_2)
      expect(todo_list.view_tasks).to eq ["Buy groceries", "Clean the house"]
    end

    it "returns the list of incomplete tasks" do
      todo_list.add_task(todo_1)
      todo_list.add_task(todo_2)
      todo_list.add_task(todo_3)
      todo_2.mark_done!
      expect(todo_list.incomplete).to eq ["Buy groceries", "Pay bills"]
    end
    it "returns the list of complete tasks" do
      todo_list.add_task(todo_1)
      todo_list.add_task(todo_2)
      todo_list.add_task(todo_3)
      todo_2.mark_done!
      expect(todo_list.complete).to eq ["Clean the house"]
    end
    
    it "marks all tasks as done" do
      todo_list.add_task(todo_1)
      todo_list.add_task(todo_2)
      todo_list.add_task(todo_3)
      todo_list.complete_all
      expect(todo_list.incomplete).to eq 0
      expect(todo_list.complete).to eq ["Buy groceries", "Clean the house", "Pay bills"]
    end
  end
end    