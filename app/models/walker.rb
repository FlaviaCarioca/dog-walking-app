class Walker < ActiveRecord::Base
	has_many :dogs, through: :walks
  	has_many :users, through: :comments
  	has_one :level
end
