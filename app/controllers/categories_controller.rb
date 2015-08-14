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
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:notice] = "Category updated successfully!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
    @page_title = 'Edit Category'
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:alert] = "Category deleted successfully!"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def index
    @page_title = 'Categories'
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @page_title = 'Category: '+@category.name
    @categories = Category.all
    @book = @category.books
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
