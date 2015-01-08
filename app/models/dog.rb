class Dog < ActiveRecord::Base
	belongs_to :user
	has_many :walks
	has_many :walkers, through: :walks

  	validates :name, presence: true, length: { maximum: 100 }
end
