class Todo
  attr_accessor :task, :done

  def initialize(task)
    @task = task
    @done = false
  end

  def mark_done!
    self.done = true
  end

  def done?
    done
  end
end