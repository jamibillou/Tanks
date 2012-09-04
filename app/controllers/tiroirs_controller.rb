class TiroirsController < ApplicationController

	def index
		@tiroir = Tiroir.where("site='Grenoble' AND numero='1'").first
		@boites = @tiroir.boites.order(:numero)
		render :show
	end

	def show
		@tiroir = Tiroir.find(params[:id])
		@boites = @tiroir.boites.order(:numero)
	end
end
