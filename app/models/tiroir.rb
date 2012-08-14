class Tiroir < ActiveRecord::Base

	attr_accessible :site, :numero, :boites

	validates :site, inclusion: { in: %w(Lyon Grenoble), message: "%{value} n'est pas une valeur correcte (Lyon ou Grenoble)" }, presence: true
	validates_presence_of :numero

	has_many :boites, dependent: :destroy

end
# == Schema Information
#
# Table name: tiroirs
#
#  id         :integer         not null, primary key
#  site       :string(255)
#  numero     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

