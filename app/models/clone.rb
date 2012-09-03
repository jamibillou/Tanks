class Clone < ActiveRecord::Base

	attr_accessible :typeI, :typeII, :nom, :reference, :origine, :localisation, :client

	belongs_to :client

	has_many  :positionings, dependent: :destroy
	has_many  :positions,	 	 through: :positionings
	has_many  :users,		 		 through: :positionings

	validates :typeI,  			 length: { maximum: 50 },  presence: true
	validates :typeII, 			 length: { maximum: 50 },  presence: true
	validates :nom,				 length: { maximum: 100 }, presence: true
	validates :localisation, inclusion: { in: %w(Lyon Grenoble), message: "%{value} n'est pas une valeur correcte (Lyon ou Grenoble)" }, presence: true
	validates :reference,		 length: { maximum: 100 }
	validates :origine,			 length: { maximum: 100 }

end
# == Schema Information
#
# Table name: clones
#
#  id           :integer         not null, primary key
#  typeI        :string(255)
#  typeII       :string(255)
#  client_id    :integer
#  nom          :string(255)
#  reference    :string(255)
#  origine      :string(255)
#  localisation :string(255)
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

