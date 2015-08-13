class CategoriesController < ApplicationController
  def new
    @page_title = 'Add New Categoy'
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "New Category created successfully!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
