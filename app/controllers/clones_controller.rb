# encoding: UTF-8
class ClonesController < ApplicationController

	before_filter :authenticate_user!

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
			new_positioning
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

	def destroy
		Clone.find(params[:id]).destroy
		redirect_to tiroirs_path, flash: { success: "Le clone a bien été supprimé !" }
	end

	private

		def new_positioning
			tiroir = Tiroir.where(site: params[:clone][:localisation], numero: params[:tiroir]).first
			boite = Boite.where(tiroir_id: tiroir, numero: params[:boite]).first
			(params[:position_first]..params[:position_last]).each do |numero|
				position = Position.where(boite_id: boite, numero: numero).first
				Positioning.create!(user: current_user, clone: @clone, position_ref: position)
			end
		end
end
