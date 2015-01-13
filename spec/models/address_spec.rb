require 'rails_helper'

RSpec.describe Address, :type => :model do
	it { is_expected.to validate_presence_of(:street_name) }
	it { is_expected.to validate_presence_of(:state_abbrv) }
	it { is_expected.to validate_presence_of(:city) }
	it { is_expected.to validate_presence_of(:zip_code) }

	it { is_expected.to ensure_length_of(:street_name).is_at_most(100) }
	it { is_expected.to ensure_length_of(:state_abbrv).is_at_most(2) }
	it { is_expected.to ensure_length_of(:city).is_at_most(50) }
	it { is_expected.to ensure_length_of(:zip_code).is_at_most(5) }

	it { is_expected.to belong_to(:addressable) }
end
