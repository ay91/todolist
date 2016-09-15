class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    redirect_to root_path
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.update
    redirect_to root_path
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to root_path
    
  private

  def task_params
    params.require(:task).permit(:body)
  end
end
