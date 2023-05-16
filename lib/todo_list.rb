class TodoList
  attr_accessor :tasks

  def initialize
    @tasks = []
  end

  def add_task(task)
    tasks << task
  end

  def view_tasks
    tasks.map(&:task)
  end

  def incomplete
    incomplete_tasks = tasks.map do |todo|
      todo.done? ? nil : todo.task
    end.compact

    incomplete_tasks.empty? ? 0 : incomplete_tasks
  end

  def complete
    complete_tasks = tasks.map do |todo|
      todo.done? ? todo.task : nil
    end.compact

    complete_tasks.empty? ? 0 : complete_tasks
  end

  def complete_all
    tasks.each { |todo| todo.mark_done! }
  end
end