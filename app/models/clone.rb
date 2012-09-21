# encoding: UTF-8
class Clone < ActiveRecord::Base

	attr_accessible :typeI, :typeII, :nom, :reference, :origine, :localisation, :client, :client_attributes, :date_banking, :milieu_congelation, :tests

	belongs_to :client

	has_many  :positionings, 	 	dependent: :destroy
	has_many  :users,		 	 		 	through: :positionings

	validates :typeI,  			 	 	length: { maximum: 50 },  					presence: true
	validates :typeII, 			   	length: { maximum: 50 },  					presence: true
	validates :nom,				 		 	length: { maximum: 100 }, 					presence: true
	validates :localisation, 		inclusion: { in: %w(Lyon Grenoble), presence: true, message: "%{value} n'est pas une valeur correcte (Lyon ou Grenoble)" } 
	validates :reference,		 		length: { maximum: 100 }
	validates :origine,			 		length: { maximum: 100 }
	validates_datetime :date_banking,																presence: true

	accepts_nested_attributes_for :client, :reject_if => lambda { |attr| attr['nom'].empty? }

	def first_position
		positionings.first.position
	end

	def last_position
		positionings.last.position
	end

	def tiroir
		boite.tiroir
	end

	def boite
		first_position.boite
	end

	def positions_in_table
		positionings.count == 1 ? "#{tiroir.numero}/#{boite.numero}/#{first_position.numero}" : "#{tiroir.numero}/#{boite.numero}/#{first_position.numero} à #{last_position.numero}"
	end

	def client_in_table
		client.nil? ? 'Lignée de base' : client.nom
	end
end
# == Schema Information
#
# Table name: clones
#
#  id                 :integer         not null, primary key
#  typeI              :string(255)
#  typeII             :string(255)
#  client_id          :integer
#  nom                :string(255)
#  reference          :string(255)
#  origine            :string(255)
#  localisation       :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  date_banking       :datetime
#  milieu_congelation :string(255)
#  tests              :string(255)
#

