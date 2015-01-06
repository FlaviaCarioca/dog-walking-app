class Address < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

  	validates :street_name, presence: true, length: { maximum: 100 }
  	validates :state_abbrv, presence: true, length: { maximum: 2 }
  	validates :city, presence: true, length: { maximum: 50 }
  	validates :zip_code, presence: true, length: { maximum: 5 }
end
