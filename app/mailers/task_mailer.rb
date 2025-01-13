class TaskMailer < ApplicationMailer
  default from: "ygornogueiramacedo@gmail.com"

  def deadline_warning(task)
    @task = task
    @user = task.todo.user
    mail(to: @user.email, subject: "Task deadline warning: '#{@task.title}' is due")
  end

  def congratulations(todo)
    @todo = todo
    @user = todo.user
    @tas_durations = @todo.tasks.map do |task|
      duration = (task.datetime - task.created_at) / 1.hour
      { title: task.title,
        duration: duration.round(2) }
    end
    mail(to: @user.email, subject: "Congratulations on completing all tasks!")
  end
end
