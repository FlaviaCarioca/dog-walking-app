class Walker < ActiveRecord::Base
	has_one :address, as: :addressable, dependent: :destroy
	has_many :walks
	has_many :dogs, through: :walks
	has_many :comments
  	has_many :users, through: :comments
  	belongs_to :level
end
