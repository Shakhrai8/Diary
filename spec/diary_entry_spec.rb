require 'diary_entry'

RSpec.describe DiaryEntry do
  let(:entry) { DiaryEntry.new("2023-05-01", "Today was a great day!") }

  context "#count_words method" do
    it "returns the correct number of words in the content" do
      expect(entry.count_words).to eq 5
    end
  end

  context "#reading_time method" do
    it "calculates the reading time correctly for a given words per minute (wpm)" do
      expect(entry.reading_time(100)).to eq 1
    end

    it "raises an error for a negative value of wpm" do
      expect { entry.reading_time(-50) }.to raise_error(RuntimeError, "Error: wpm should be a non-negative integer")
    end
  end
end
