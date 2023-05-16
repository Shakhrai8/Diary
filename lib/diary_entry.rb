class DiaryEntry
  attr_accessor :date, :content, :contacts

  def initialize(date, content, contacts = [])
    @date = date
    @content = content
    @contacts = contacts
  end

  def count_words
    content.split(" ").length
  end

  def reading_time(wpm)
    fail "Error: wpm should be a non-negative integer" if wpm < 0
    (count_words / wpm.to_f).ceil
  end
end
