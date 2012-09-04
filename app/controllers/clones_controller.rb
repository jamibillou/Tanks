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
			new_positioning
			redirect_to root_path, flash: { success: "Le clone a bien été crée !"}
		end	
	end

	private

		def new_positioning
			tiroir = Tiroir.where(site: params[:clone][:localisation], numero: params[:tiroir]).first
			boite = Boite.where(tiroir_id: tiroir, numero: params[:boite]).first
			if params[:position_first] == params[:position_last]
				position = Position.where(boite_id: boite, numero: params[:position_first]).first
				Positioning.create!(user: current_user, clone: @clone, position_ref: position)
			else
				## to be completed
			end
		end
end
