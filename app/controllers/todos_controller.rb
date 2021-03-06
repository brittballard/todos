class TodosController < ApplicationController
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    @todo.save!
    redirect_to action: :index
  end

  def send_todos
    TodoMailer.
      completed_todos(current_user.email).
      deliver
    redirect_to action: :index
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end
