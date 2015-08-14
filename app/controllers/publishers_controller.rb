class PublishersController < ApplicationController
  def new
    @page_title = 'Add New Publisher'
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:notice] = "New Publisher added successfully!"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update(publisher_params)
      flash[:notice] = "Publisher edited successfully!"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
    @page_title = 'Edit Publisher: '+@publisher.name
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    if @publisher.destroy
      flash[:alert] = "Publisher deleted successfully!"
      redirect_to publishers_path
    else
      render 'new'
    end
  end

  def index
    @page_title = 'Publishers'
    @publisher = Publisher.all
  end

  def show
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
