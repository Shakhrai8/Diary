require 'diary'
require 'diary_entry'
require 'contact'
require 'contact_list'

RSpec.describe "Diary Integration" do
  let(:diary) { Diary.new }
  let(:entry_1) { DiaryEntry.new("2023-05-01", "Today was a great day!") }
  let(:entry_2) { DiaryEntry.new("2023-05-02", "Feeling tired, need some rest.") }
  let(:entry_3) { DiaryEntry.new("2023-05-03", "Started a new project.", [Contact.new("John Doe", "1234567890")])}
  let(:entry_4) { DiaryEntry.new("2023-05-04", "Met Jane Smith.", [Contact.new("Jane Smith", "9876543210")]) }

  context "#list method" do
    it "returns list of entries" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.list).to eq [entry_1, entry_2]
    end
  end

  context "#count_words method" do
    it "total number of words in diary array" do
      diary.add(entry_1)
      expect(diary.count_words).to eq 5
    end

    it "total number of words in diary array" do
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.count_words).to eq 10
    end
  end

  context "#select_entries method" do
    it "returns an entry which could be read within given time" do
      diary.add(entry_1)
      diary.add(entry_4)
      expect(diary.select_entries(3, 1)).to eq entry_4
    end

    it "returns an entry which could be read within given time" do
      diary.add(entry_1)
      diary.add(entry_3)
      diary.add(entry_4)
      expect(diary.select_entries(2, 2)).to eq entry_3
    end
  end

end