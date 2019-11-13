class MoviesController < ApplicationController

	before_action :authenticate_user!
	def index
		@movies = Movie.all
		@movie = Movie.new
		@user = current_user
	end

	def show
		@movie = Movie.find(params[:id])
		@user = @movie.user
	end

	def create
		@movie = Movie.new(movie_params)
		@movie.user = current_user
		if @movie.save
			flash[:notice] = "successfully"
			redirect_to movie_path(@movie)
		else
			@movies = Movie.all
			@user = current_user
			render action: :index
	  end
  end

	def edit
		@movie = Movie.find(params[:id])
		if @movie.user != current_user
     redirect_to movies_path
   end
	end

	def update
		@movie = Movie.find(params[:id])
		if @movie.update(movie_params)
			flash[:notice] = "You have updated book successfully."
			redirect_to movie_path
		else
			render "edit"
	  end
	end

	private
	def movie_params
		params.require(:movie).permit(:title, :body)
	end
end
