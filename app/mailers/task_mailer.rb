class TaskMailer < ApplicationMailer
  default from: "no-reply-todoapp@gmail.com"

  def deadline_warning(task)
    @task = task
    @user = task.todo.user
    mail(to: @user.email, subject: "Task deadline warning: '#{@task.title}' is due")
  end

  def congratulations(todo)
    @todo = todo
    @user = todo.user

    # Garante que tasks tenham as datas corretas para evitar erros de nil
    @task_durations = @todo.tasks.map do |task|
      if task.created_at && task.datetime
        duration = (task.datetime - task.created_at) / 1.hour
        { title: task.title, duration: duration.round(2) }
      else
        { title: task.title, duration: 0 } # Duração definida como 0 caso as datas sejam ausentes
      end
    end

    # Envia o e-mail com os dados
    mail(to: @user.email, subject: "Congratulations on completing all tasks!")
  end
end
