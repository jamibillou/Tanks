tiroirs = Tiroir.create!([ { site: 'Lyon', numero: 1 }, { site: 'Lyon', numero: 2 }, { site: 'Lyon', numero: 3 }, 
						{ site: 'Lyon', numero: 4 }, { site: 'Lyon', numero: 5 }, { site: 'Lyon', numero: 6 },
						{ site: 'Grenoble', numero: 1 }, { site: 'Grenoble', numero: 2 }, { site: 'Grenoble', numero: 3 }, 
						{ site: 'Grenoble', numero: 4 }, { site: 'Grenoble', numero: 5 }, { site: 'Grenoble', numero: 6 } ])

tiroirs.each do |tiroir_id|
	[1..5].each do |num|
		Boite.create!( tiroir_id: tiroir_id, numero: num )
	end
end

Boite.all.each do |boite_id|
	[1..25].each do |num|
		Position.create!( boite_id: boite_id, numero: num )
	end
end
