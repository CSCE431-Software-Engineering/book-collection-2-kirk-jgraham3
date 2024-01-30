class BooksController < ApplicationController
  def index
    @created_by = "Kirk"
    @books = Book.all
  end

  # def about
  #   @created_by = "Kirk"
  # end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path, notice: 'Book was successfully updated.'
    else
      render 'edit' 
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book was successfully deleted.'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(
      :title,
      :author,
      :price,
      :published_date
    )
  end
end
