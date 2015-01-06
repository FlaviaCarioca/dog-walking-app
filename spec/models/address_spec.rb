require 'rails_helper'

RSpec.describe Address, :type => :model do
	it { should validate_presence_of(:street_name) }
	it { should validate_presence_of(:state_abbrv) }
	it { should validate_presence_of(:city) }
	it { should validate_presence_of(:zip_code) }

	it { should ensure_length_of(:street_name).is_at_most(100) }
	it { should ensure_length_of(:state_abbrv).is_at_most(2) }
	it { should ensure_length_of(:city).is_at_most(50) }
	it { should ensure_length_of(:zip_code).is_at_most(5) }
end
