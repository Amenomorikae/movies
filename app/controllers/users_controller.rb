class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@movie = Movie.new
		@movies = @user.movies
	end

	def index
		@users = User.all
		@user = current_user
		@movie = Movie.new
	end

	def create
		@user = User.new(user_params)
		@user.user_id = current_user.id
		if @user.save
			flash[:notice] = "successfully"
			redirect_to user_path
		else
			render action: :index
		end
	end

	def edit
		@user = User.find(params[:id])
		@movie = Movie.new
		if current_user.id != @user.id
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "successfully"
			redirect_to user_path
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
