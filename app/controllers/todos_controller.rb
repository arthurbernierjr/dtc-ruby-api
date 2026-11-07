class TodosController < ApplicationController
  before_action :set_todo, only: %i[show update destroy]

  def index
    render json: Todo.order(:id)
  end

  def show
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo, status: :created
    else
      render json: { error: @todo.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: { error: @todo.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  def destroy
    @todo.destroy!
    head :no_content
  end

  private

  def set_todo
    @todo = Todo.find(params.expect(:id))
  end

  def todo_params
    params.expect(todo: [:subject, :details])
  end
end
