class CommentsController < ApplicationController
  before_action :authenticate
  before_action :load_meal_log
  before_action :load_comment, except: [:new, :index, :create]
  def index #show all data: GET
    
  end
  
  def new #return a form URL to create new data :GET
    @comment = Comment.new
  end
  
  def create #create new data :POST
    @comment = Comment.new comment_params
    #@comment.meal_log = @meal_log
    if @meal_log.comments << @comment
      redirect_to meal_log_comment_path(@meal_log,@comment), notice: "Comment posted."
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def show #show a specific data :GET
  end
  
  def edit #return a form URL to edit existing data :GET
  end
  
  def update #update information of existing data :PATCH/PUT
   if @comment.update comment_params
     redirect_to meal_log_comment_path(@meal_log,@comment), notice: "Comment updated."
   else
     render :edit, status: :unprocessable_entity
   end
  end
  
  def destroy #delete a data :DELETE
   @comment.destroy
   redirect_to meal_log_comments_path(@meal_log), notice: "Comment deleted."
  end
  
  private
  
  def load_meal_log
    @meal_log = MealLog.find params[:meal_log_id]
  end
  
  def load_comment
    @comment = @meal_log.comments.find params[:id]
  end  
  
  def comment_params
    params.require(:comment).permit(:title, :rate, :comment_body)
  end
end
