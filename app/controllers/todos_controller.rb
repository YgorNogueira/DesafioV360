class TodosController < ApplicationController
  before_action :set_todo, only: %i[show edit update destroy]

  # GET /todos or /todos.json
  def index
    @todos = current_user.todos
  end

  # GET /todos/1 or /todos/1.json
  def show
    @task = Task.new
    @tasks = @todo.tasks
  end

  # GET /todos/new
  def new
    @todo = current_user.todos.new
    respond_to do |format|
      format.turbo_stream { render :new }
      format.html
    end
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to todos_path, notice: "To-Do created successfully!" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to @todo, notice: "Todo was successfully updated." }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, status: :see_other, notice: "Todo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = current_user.todos.find(params[:id]) # Aqui estamos buscando somente entre os todos do usuário atual
  end

  # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:name) # `permit` para permitir os parâmetros de forma segura
  end
end
