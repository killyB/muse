class UsersController < ApplicationController

	def posts
		@user = User.find(params[:id])
		@posts = @user.posts
		
	end

	def comments
		@user = User.find(params[:id])
		@comments = @user.comments
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
		@comments = @user.comments

	end

end