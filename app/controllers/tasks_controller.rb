class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    Task.new(params[:task]).save
    redirect_to '/tasks'
  end

  def destroy
    Task.delete(params[:id])
    redirect_to '/tasks'
  end

  def update
    @task = Task.find(params[:id])
    @task.done = params[:task][:done]
    @task.save
    render nothing: true
  end
end
