class TiroirsController < ApplicationController

	def index
		@boites = Tiroir.where("site=Grenoble AND numero='1'").boites.order(:numero)
	end
end
