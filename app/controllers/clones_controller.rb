class ClonesController < ApplicationController

	def new
		@clone = Clone.new
	end
end
