class MealLogsController < ApplicationController
  before_action :authenticate
  before_action :load_log, except: [:new, :index, :create]
  def index #show all data: GET
    #@meal_logs = current_user.meal_logs.all
    @meal_logs = MealLog.all
  end
  
  def new #return a form URL to create new data :GET
    @meal_log = MealLog.new
  end
  
  def create #create new data :POST
    @meal_log = MealLog.new meal_log_params
    @meal_log.user = current_user
    if @meal_log.save
      redirect_to meal_logs_path, notice: "Meal log created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show #show a specific data :GET
  end
  
  def edit #return a form URL to edit existing data :GET
  end
  
  def update #update information of existing data :PATCH/PUT
   if @meal_log.update meal_log_params
     redirect_to @meal_log, notice: "Meal log updated."
   else
     render :edit, status: :unprocessable_entity
   end
  end
  
  def destroy #delete a data :DELETE
   @meal_log.destroy
   redirect_to meal_logs_path, notice: "Meal log deleted."
  end
  

  
  private

  def load_log
    @meal_log = MealLog.find params[:id]
  end

  def meal_log_params
    params.require(:meal_log).permit(:Eat_date, :Meal_name, :Calorie, :Meal_description, :category_id, :image)
  end
end
