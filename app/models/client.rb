class Client < ActiveRecord::Base

	attr_accesible :nom

	validates :nom, length: { maximum: 80 }, presence: true
end
# == Schema Information
#
# Table name: clients
#
#  id         :integer         not null, primary key
#  nom        :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

