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
end
