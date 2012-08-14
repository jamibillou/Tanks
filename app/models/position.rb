class Position < ActiveRecord::Base

	attr_accessible :boite_id, :numero

	belongs_to :boite

	has_many :positionings, dependent: :destroy
	has_many :users,				through: :positionings
	has_many :clones,				through: :positionings

	validates_presence_of :boite, :numero
end
# == Schema Information
#
# Table name: positions
#
#  id         :integer         not null, primary key
#  boite_id   :integer
#  numero     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

