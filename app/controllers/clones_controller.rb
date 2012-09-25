# encoding: UTF-8
class ClonesController < ApplicationController

	before_filter :authenticate_user!

	def new
		@clone = Clone.new
		@clone.client = Client.new
	end

	def create
		@clone = Clone.new params[:clone]
		unless @clone.save
			redirect_to new_clone_path, flash: { error: error_messages(@clone) }
		else
			create_positioning
			redirect_to root_path, flash: { success: "Le clone a bien été crée !"}
		end	
	end

	def show
		@clone = Clone.find(params[:id])
		@tiroir = @clone.tiroir
		@boites = @tiroir.boites.order(:numero)
	end

	def edit
		@clone = Clone.find(params[:id])
	end	

	def update
		@clone = Clone.find(params[:id])
		unless @clone.update_attributes params[:clone]
			flash[:error] = error_messages @clone
			render :edit, id: @clone
		else
			@clone.positionings.destroy_all
			create_positioning
			redirect_to clone_path(@clone), flash: { success: "Le clone a bien été mis à jour !"}
		end
	end

	def destroy
		Clone.find(params[:id]).destroy
		redirect_to tiroirs_path, flash: { success: "Le clone a bien été supprimé !" }
	end

	private
		def create_positioning
			tiroir = Tiroir.where(site: params[:clone][:localisation], numero: params[:tiroir]).first
			boite = Boite.where(tiroir_id: tiroir, numero: params[:boite]).first
			(params[:first_position]..params[:last_position]).each do |numero|
				position = Position.where(boite_id: boite, numero: numero).first
				Positioning.create!(user: current_user, clone: @clone, position_ref: position)
			end
		end
end
