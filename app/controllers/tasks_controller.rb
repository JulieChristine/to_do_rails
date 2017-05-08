class TasksController < ApplicationController
  def show
    @task = task_params.find(params[:id])
    @task = @list.task.show
    render :show
  end

  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task successfully added!"
        respond_to do |format|
          format.html { redirect_to list_path(@task.list) }
          format.js
        end
      else
        render :new
      end
    end

  def edit
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    render :edit
  end

  def update
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    if @task.update(task_params)
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @task = @list.tasks.find(params[:id])
    @task.destroy
    redirect_to list_path(@task.list)
  end

  private
    def task_params
      params.require(:task).permit(:description)
    end

end
