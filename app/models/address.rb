class Address < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

  	validates :street_name, presence: true, length: { max: 100 }
  	validates :state_abbrv, presence: true, length: { max: 2 }
  	validates :city, presence: true, length: { max: 50 }
  	validates :zip_code, presence: true, length: { max: 5 }
end
