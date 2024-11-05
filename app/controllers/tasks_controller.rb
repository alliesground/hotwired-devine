class TasksController < ApplicationController
  before_action :set_project, only: :create
  before_action :set_task, only: %i[destroy complete]
  
  def create
    @task = Task.new(project: @project, **task_params)

    if @task.save
      redirect_to project_path(@project), notice: "Successfully created a new task"
    else
      redirect_to project_path(@project), status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy!

    redirect_to project_path(@project), notice: "Task was Successfully deleted"
  end

  def complete
    @task.update(complete: params[:task][:complete])
    Turbo::StreamsChannel.broadcast_refresh_to(:projects)
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

  def set_task
    @task = Task.find(params[:id])
    @project = @task.project
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
