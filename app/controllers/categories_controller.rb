class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    
    def show
        @category = Category.find(params[:id])
        @meal_logs = @category.meal_logs
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
    
        if @category.save
            redirect_to categories_path, notice: "Category created successfully."
        else
            render :new, status: :unprocessable_entity
        end
    end
    
     def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
    
        if @category.update(category_params)
          redirect_to categories_path, notice: "Category updated successfully."
        else
          render :edit, status: :unprocessable_entity
        end
    end

  private

  def category_params
    params.require(:category).permit(:name, :description, :color)
  end
    
end
