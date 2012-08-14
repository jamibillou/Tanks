# encoding: UTF-8
class ClonesController < ApplicationController

	def new
		@clone = Clone.new
	end

	def create
		@clone = Clone.new params[:clone]
		unless(params[:client].blank?)
			@clone.client = Client.find_or_create_by_nom(params[:client])
		end
		unless @clone.save
			redirect_to new_clone_path, flash: { error: error_messages(@clone) }
		else
			redirect_to root_path, flash: { success: "Le clone a bien été crée !"}
		end	
	end
end
