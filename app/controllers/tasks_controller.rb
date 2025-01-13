class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to todo_path(@task.todo_id), notice: "Task was successfully created."
    else
      redirect_to root_path, alert: "Task was not created."
    end
  end


  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to todo_path(@task.todo_id), notice: "Task was successfully updated."
        if @task.datetime.present? && (@task.datetime - Time.current) < 1.day
          TaskMailer.deadline_warning(@task).deliver_now
        end
        if @task.todo.tasks.where.not(status: "done").empty?
          TaskMailer.congratulations(@task.todo).deliver_now
        end
    else
      redirect_to root_path, alert: "Task was not updated."
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :todo_id, :done, :datetime)
  end
end
