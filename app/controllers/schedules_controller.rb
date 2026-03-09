class SchedulesController < ApplicationController
  # READ
  def index
    @schedules = Schedule.all
  end

  # READ
  def show
    @schedule = Schedule.find(params[:id])
  end


  # CREATE
  def new
    @schedule = Schedule.new
  end

  # CREATE
  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # UPDATE
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # UPDATE
  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to schedules_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to schedules_path
  end

  private

  # ストロングパラメータ
  def schedule_params
    params.require(:schedule).permit(:title, :start_date, :end_date, :all_day, :memo)
  end
end
