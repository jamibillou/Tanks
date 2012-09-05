class Positioning < ActiveRecord::Base

	attr_accessible :clone, :user, :position_ref, :position_travail, :position_id_ref, :position_id_travail

	belongs_to :position_ref, 			class_name: 'Position', foreign_key: 'position_id_ref'
	belongs_to :position_travail, 	class_name: 'Position', foreign_key: 'position_id_travail'
	belongs_to :user
	belongs_to :clone

	def position
		position_ref.nil? ? position_travail : position_ref
	end
end
# == Schema Information
#
# Table name: positionings
#
#  id                  :integer         not null, primary key
#  clone_id            :integer
#  user_id             :integer
#  position_id_ref     :integer
#  position_id_travail :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

