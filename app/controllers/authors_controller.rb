class AuthorsController < ApplicationController
  def new
    @page_title = 'Add New Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "New Author added successfully!"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    if @author.update(author_params)
      flash[:notice] = "Author edited successfully!"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = 'Edit Author: '+@author.first_name+' '+@author.last_name
  end

  def destroy
    @author = Author.find(params[:id])
    if @author.destroy
      flash[:alert] = "Author deleted successfully!"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def index
    @page_title = 'Authors'
    @author = Author.all
  end

  def show
  end

  private
    def author_params
      params.require(:author).permit(:first_name, :last_name)
    end
end
