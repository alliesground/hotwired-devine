class ProjectsController < ApplicationController

  # GET /projects/index
  def index
    @projects = Project.all
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to projects_path, notice: "Project was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title)
  end
end
