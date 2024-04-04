class TasksController < ApplicationController
  before_action :set_project
  
  def create
    @task = Task.new(project: @project, **task_params)

    if @task.save
      redirect_to project_path(@project), notice: "Successfully created a new task"
    else
      redirect_to project_path(@project), status: :unprocessable_entity
    end
  end

  private
  
  def task_params
    params.require(:task).permit(:name)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
