class API::V1::TasksController < API::V1::BaseController
  before_action :authenticate_request
  respond_to :json
  # respond_to :js

  def index
    @tasks = Task.all
    render json: @tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_api_user.tasks.create(task_params)
    if @task.save
      render json: @task, status: 200
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])

    if @task.update(task_params)
      redirect_to tasks_path
    else
      redirect_to tasks_path
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.destroy
      render json: @task, status: 200
    end
  end

  def complete
    @task = Task.find_by(id: params[:id])
    @task.update_attributes(:completed => params[:completed])
    render json: @task
  end

  private

  def task_params
    params.require(:task).permit(:body)
  end
end
