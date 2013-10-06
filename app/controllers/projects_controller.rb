class ProjectsController < ApplicationController
  def update
    project = Project.find(params[:id])
    project.notes = params[:project][:notes]
    project.save

    redirect_to project_tasks_path(project)
  end
end
