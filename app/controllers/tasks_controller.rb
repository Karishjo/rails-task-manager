class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)
    @tasks.save
    redirect_to tasks_path(@task)
  end

  def show
  end

  def edit
  end

  def update
    @tasks.update(task_params)
    redirect_to tasks_path(@task)
  end

  def destroy
    @tasks.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @tasks = Task.find(params[:id])
  end
end
