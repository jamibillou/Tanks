module TiroirsHelper

	def getClone(boite_id,numero)
		position = Position.all(conditions: { boite_id: boite_id, numero: numero }).last
		if position.nil?
			numero
		else
			positioning = Positioning.where("position_id_ref='#{position.id}' OR position_id_travail='#{position.id}'").last
			unless positioning.nil?
				positioning.clone.nom
			else
				numero
			end	
		end
	end
end
