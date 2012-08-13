class Position < ActiveRecord::Base

	attr_accessible :boite_id, :numero

	belongs_to :boite

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

