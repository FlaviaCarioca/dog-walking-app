class Dog < ActiveRecord::Base
	belongs_to :user
	has_many :walkers, through: :walks

  	validates :name, presence: true, limit: { max: 100 }
end
