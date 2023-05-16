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