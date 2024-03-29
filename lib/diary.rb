class Diary
  attr_accessor :entries

  def initialize
    @entries = []
    @task_list = TodoList.new
  end

  def add(entry) 
    entries << entry
  end

  def list
    entries.each do |entry|
      puts "Date: #{entry.date}"
      puts "Content: #{entry.content}"
      puts "------------------------"
    end
  end

  def count_words
    total = 0
    entries.each do |entry|
      total += entry.count_words
    end
    return total
  end

  def select_entries(wpm, minutes)
    readable_entries = entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end

    return readable_entries.max_by { |entry| entry.count_words } if readable_entries.any?

  end

  def find_phone_numbers
    phone_numbers = []
    entries.each do |entry|
      entry.contacts.each do |contact|
        phone_numbers << contact.phone_number
      end
    end
    phone_numbers
  end
end