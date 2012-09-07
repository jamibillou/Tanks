User.create!( email: "francksabattier@px-therapeutics.com", password: "jamiro73" )
User.create!( email: "milizadiab@px-therapeutics.com", 	 	 	password: "miliza" )
User.create!( email: "audreyjordana@px-therapeutics.com", 	password: "audrey" )
User.create!( email: "marjoriehaller@px-therapeutics.com", 	password: "marjorie" )
User.create!( email: "murielleverges@px-therapeutics.com", 	password: "murielle")

tiroirs = Tiroir.create!([ { site: 'Lyon', numero: 1 }, { site: 'Lyon', numero: 2 }, { site: 'Lyon', numero: 3 }, 
													 { site: 'Lyon', numero: 4 }, { site: 'Lyon', numero: 5 }, { site: 'Lyon', numero: 6 },
													 { site: 'Grenoble', numero: 1 }, { site: 'Grenoble', numero: 2 }, { site: 'Grenoble', numero: 3 }, 
													 { site: 'Grenoble', numero: 4 }, { site: 'Grenoble', numero: 5 }, { site: 'Grenoble', numero: 6 } ])

tiroirs.each do |tiroir|
	(1..5).each do |num|
		Boite.create!( tiroir_id: tiroir.id, numero: num )
	end
end

Boite.all.each do |boite|
	(1..25).each do |num|
		Position.create!( boite_id: boite.id, numero: num )
	end
end
