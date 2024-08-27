# frozen_string_literal:false

# Esta clase manejará la lógixa del controller
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # Instancia para el form_with
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
