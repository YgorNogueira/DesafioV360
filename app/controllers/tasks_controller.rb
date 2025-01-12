class TasksController < ApplicationController
  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to todo_path(@task.todo_id), notice: "Task was successfully created."
    else
      redirect_to root_path, alert: "Task was not created."
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :todo_id, :done, :datetime)
  end
end
