class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  def destroy
    Task.find(params[:id]).destroy
    redirect_to root_path
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(task_params)
      redirect_to @task
    else
      render 'edit'
    end
  end

  def show
    @task = Task.find(params[:id])
    @hash = [{:lat => @task.lat, :lng => @task.lng}]
  end

  private

    def task_params
      params.require(:task).permit(:lat, :lng, :question)
    end
end
