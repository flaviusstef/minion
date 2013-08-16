class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    Task.new(title: params[:task]).save
    redirect_to '/tasks'
  end
end
