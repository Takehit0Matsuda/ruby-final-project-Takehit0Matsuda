class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]
  before_action :load_user, except: [:new, :create]
  before_action :correct_user, only: [:show]
  
  def new
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.valid?
    else
       @user = User.new
    end
  end
  
  def create
    if session[:user_hash]
      @user = User.new_from_hash session[:user_hash]
      @user.name = user_params[:name]
      @user.email = user_params[:email]
    else
      @user = User.new user_params
    end
    if @user.save
      login(@user)
      session[:user_hash] = nil
      redirect_to root_path, notice: "You successfully signed up."
    else
      render :new, status: :unprocessable_entity
    end
  end 
  
  def show #show a specific data :GET
  end
  
  def edit #return a form URL to edit existing data :GET
  end
  
  def update
    if @user.has_password?
      current_password = params[:user][:current_password]
      if @user.authenticate(current_password)
        if @user.update(user_params.except(:current_password))
          redirect_to @user, notice: "User Information updated."
        else
          render :edit, status: :unprocessable_entity
        end
      else
        @user.errors.add(:current_password, :invalid)
        render :edit, status: :unprocessable_entity
      end
    else
      if @user.update(user_params)
        redirect_to @user, notice: "User Information updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  
  def destroy #delete a data :DELETE
    logout
    @user.destroy
    redirect_to root_path, notice: "User deleted."
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation, :current_password).with_defaults(current_password: "")
  end
  
  def load_user
    @user = User.find_by(id: params[:id])
  end
  
  def correct_user
    redirect_to(user_path(current_user)) unless current_user == @user
  end
  
end
