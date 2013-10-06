require "net/http"
require "uri"
require "json"

class TasksController < ApplicationController
  def index
    if params[:from] && params[:from] == 'basecamp'
      uri = URI.parse("https://basecamp.com/1761938/api/v1/people/141352/assigned_todos.json")

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      request.basic_auth("flavius.stef@mozaicworks.com", "mozaic$ford")
      request['User-Agent'] = 'Minion (flavius.stef@gmail.com)'
      @response = http.request(request)

      render :basecamp
    else
      @projects = Project.all
      @selected_project = Project.find(params[:project_id])
      @tasks = @selected_project.tasks
    end
  end

  def create
    t = Task.new(params[:task])
    t.project = Project.find(params[:project_id])
    t.save
    redirect_to project_tasks_path(params[:project_id])
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

  def basecamp
  end
end
