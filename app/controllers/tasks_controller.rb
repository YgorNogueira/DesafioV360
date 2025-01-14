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
      # Redireciona para a página da To-Do List com mensagem de sucesso
      redirect_to todos_path(@task.todo_id), notice: "Task was successfully updated."

      # Enviar aviso de prazo se o prazo for menor que 1 dia
      send_deadline_warning_email if approaching_deadline?

      # Enviar congratulações se todas as tasks estiverem concluídas
      send_congratulations_email if all_tasks_done?
    else
      # Redireciona para a página principal com mensagem de erro
      redirect_to root_path, alert: "Task was not updated."
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :todo_id, :done, :datetime)
  end

  # Verifica se a task possui uma data/hora de vencimento próxima (menos de 1 dia)
  def approaching_deadline?
    @task.datetime.present? && (@task.datetime - Time.current) < 1.day
  end

  # Verifica se todas as tasks da To-Do List foram concluídas
  def all_tasks_done?
    @task.todo.tasks.where(done: false).empty?
  end

  # Envia o e-mail de aviso de prazo
  def send_deadline_warning_email
    TaskMailer.deadline_warning(@task).deliver_now
  end

  # Envia o e-mail de congratulações por completar todas as tasks
  def send_congratulations_email
    TaskMailer.congratulations(@task.todo).deliver_now
  end
end
