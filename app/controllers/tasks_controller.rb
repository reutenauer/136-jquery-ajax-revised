class TasksController < ApplicationController
  def index
    sleep 1
    if user_signed_in?
      @incomplete_tasks = Task.where(complete: false, user_id: current_user.id)
      @complete_tasks = Task.where(complete: true, user_id: current_user.id)
      @tasks_being_followed = current_user.tasks
      @all_my_tasks = @incomplete_tasks + @complete_tasks
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(params[:task].merge(user_id: current_user.id))
    redirect_to tasks_url
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(params[:task])
    redirect_to tasks_url
  end

  def destroy
    @task = Task.destroy(params[:id])
    redirect_to tasks_url
  end

  def assign
    @task = Task.find(params[:id])
    @assignee = User.find(params[:assignee_id])
    @task.assign(@assignee)
  end
end
