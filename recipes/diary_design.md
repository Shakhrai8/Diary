# Multi-Class Planned Design Recipe

## 1. Describe the Problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading
> speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌───────────────────────────┐         ┌───────────────────────────┐
│TodoList                   │         │Todo                       │
│                           │         │                           │
│      - add(task)          │   add   │                           │
│      - list               ├─────────►     - mark_done!          │
│      - compplete          │         │     - done?               │
│      - incomplete         │         │                           │
│      - complete_all       │         │                           │
└───────────────────────────┘         └───────────────────────────┘



┌───────────────────────────┐         ┌───────────────────────────┐
│Diary                      │         │DiaryEntry                 │
│                           │         │                           │
│   - add(diary_entry)      │   add   │     - initializer         │
│   - list                  ├─────────►                           │
│   - select_entries        │         │                           │
│    (wpm, min)             │         │                           │
│   - find_contact          │         │                           │
└───────────┬───────────────┘         └───────────────────────────┘
            │
            │
            │Searches for one
            │or more contacts
            │
┌───────────▼───────────────┐         ┌───────────────────────────┐
│Contact                    │         │ContactList                │
│                           │         │                           │
│    - initializer          │   add   │     - add_number          │
│                           ◄─────────┤     - view_number         │
│                           │         │                           │
│                           │         │                           │
│                           │         │                           │
└───────────────────────────┘         └───────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class DiaryEntry

  def initialize(date, content, contacts = [])
    #....
  end
end

class Diary

  def initialize
    #....
  end

  def add(entry) # entry is a new DiaryEntry instance
    # adds entry to the array
    # returns nothing
  end

  def list
    # returns all entries
  end

  def select_entries(wpm, minutes)
    # returns entries which could be read within given time
  end

  def find_phone_numbers
    #returns all contact numbers
  end
end

class TodoList

  def initialize
    #....
  end

  def add_task(task) #task is a string from Todo class
    # adds new task as a string
  end

  def view_tasks
    tasks.each_with_index do |task, index|
      puts "#{index + 1}. #{task}"
    end
  end
end

class Contact

  def initialize(name, phone_number)
    #.....
  end
end

class ContactList

  def initialize
    #...
  end

  def add_contact(contact) 
    # adds new contact
  end

  def view_numbers
    # returns all phone numbers
  end  
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# Making life easier
let(:todo_1) { Todo.new("Buy groceries") }
let(:todo_2) { Todo.new("Finish homework") }

let(:entry_1) { DiaryEntry.new("2023-05-01", "Today was a great day!") }
let(:entry_2) { DiaryEntry.new("2023-05-02", "Feeling tired, need some rest.") }
let(:entry_3) { DiaryEntry.new("2023-05-03", "Started a new project.", [Contact.new("John Doe", "1234567890")])}
let(:entry_4) { DiaryEntry.new("2023-05-04", "Met Jane Smith.", [Contact.new("Jane Smith", "9876543210")]) }
# assigning some global variables

# Test the list method
diary = Diary.new
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.read_entries
# returns our entries

# Test the select_entries method
diary = Diary.new
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
diary.select_entries
# returns entries which could be read within the given time

# Test the view_tasks method
todo_list = TodoList.new
todo_list.add(todo_1)
todo_list.add(todo_2)
todo_list.view_tasks
# returns our todos
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# Test diary class
diary = Diary.new
diary.list
# returns []

# Test contact list class
list = ContactList.new
list.view_numbers
# returns []

# Test todo list class
todo_list = TodoList.new
todo_list.view_tasks
# returns []
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
