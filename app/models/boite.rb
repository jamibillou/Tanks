class Boite < ActiveRecord::Base

	attr_accessible :numero, :tiroir_id, :positions

	belongs_to :tiroir

	has_many :positions, dependent: :destroy

	validates_presence_of :numero, :tiroir

end
# == Schema Information
#
# Table name: boites
#
#  id         :integer         not null, primary key
#  numero     :integer
#  tiroir_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

