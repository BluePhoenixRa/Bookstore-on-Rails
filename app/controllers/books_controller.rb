class BooksController < ApplicationController
  def new
    @page_title = 'Add New Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "New Book added successfully!"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book updated successfully!"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @page_title = 'Edit Book: '+@book.title
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:alert] = "Book deleted successfully!"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def index
    @book = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @page_title = @book.title
    @categories = Category.all
  end

  private
    def book_params
      params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :buy, :format, :excerpt, :pages, :year, :coverpath)
    end
end
