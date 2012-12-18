# encoding: UTF-8
	class UsersController < ApplicationController

	before_filter :signed_in?
	before_filter :admin_user, only: [:index,:edit,:new]

	def new
		@user = User.new
		@users = User.all
	end	

	def create
		@user = User.new params[:user]
		unless @user.save
			redirect_to new_user_path, flash: {error: error_messages(@user)}
		else
			redirect_to users_path, flash: {success: "L'utilisateur a bien été crée"}
		end	
	end

	def edit
		@user = User.find(params[:id])
		@users = User.all
	end

	def update
		@user = User.find(params[:id])
		unless @user.update_attributes params[:user]
			flash[:error] = error_messages @user
			render :edit, id: @user
		else
			redirect_to users_path, flash: {success: "L'utilisateur a bien été mis à jour !"}
		end
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to users_path, flash: {success: "L'utilisateur a bien été supprimé !"}
	end	
	
	def index
		@users = User.all
	end
end
