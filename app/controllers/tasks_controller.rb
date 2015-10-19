class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def sort
    #hits the database everytime
    params[:order].each do |key,value|
      Task.find(value[:id]).update_attribute(:position, value[:position])
    end
    render :nothing => true
  end

  # GET /tasks
  def index
    @tasks = Task.where(user_id: @current_user.id)
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user_id = @current_user.id
    if @task.save
      respond_to do |format|
        format.js {   }
      end
    else
      # Noooooo
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      respond_to do |format|
        format.js {   }
      end
    else
      # whaaaa
    end
  end

  # DELETE /tasks/1
  def destroy
    if @task.destroy
      respond_to do |format|
        format.js {   }
      end
    else
      # whaaaa
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:owner_task_id, :user_id, :name, :description, :due_at, :position, :category_id, :status_id)
    end
end
