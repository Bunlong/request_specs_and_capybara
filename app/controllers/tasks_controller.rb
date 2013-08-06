class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    task = Task.new(params[:task])
    
    if task.save
      flash[:notice] = "Successfully added task."
      redirect_to request.path
    end
  end
end