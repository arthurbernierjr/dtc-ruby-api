class TodosController < ApplicationController
  before_action :set_todo, only: %i[show update destroy]

  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_content
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_content
    end
  end

  def destroy
    @todo.destroy!
  end

  private

  def set_todo
    @todo = Todo.find(params.expect(:id))
  end

  def todo_params
    params.expect(todo: [:subject, :details])
  end
end
