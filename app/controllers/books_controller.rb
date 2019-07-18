class BooksController < ApplicationController
	def index
		render json: { status: 200, data: Book.all }, status: :ok
	end
	
	def create
		#protect_from_forgery with: :null_session
		@book = Book.create(book_params)
		
		if @book.save
			render json: { status: 201, message: 'book created!', data: @book }, status: :created
		else
			render json: { status: 422, message: 'book not created', data: @book.errors }, status: :unprocessable_entity
		end
	end
	
	def show
		@book = Book.find(params[:id])
		render json: { status: 200, data: @book }, status: :ok
	end
	
	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
		  render json: { status: 200, message: 'Book updated!', data: @book }, status: :ok
		else
		  render json: { status: 422, message: 'Book not updated', data: @book.errors }, status: :unprocessable_entity
		end
	end

	private
	def book_params
		params.require(:book).permit(:title, :price, :genre)
	end	
end
