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
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @page_title = @category.name
    @categories = Category.all
    @book = @category.books
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
