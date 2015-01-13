require 'rails_helper'

RSpec.describe Dog, :type => :model do
	context 'validations' do
		it { is_expected.to validate_presence_of(:name) }
		it { is_expected.to ensure_length_of(:name).is_at_most(100) }
	end

	context 'expectations' do
		it { is_expected.to belong_to(:user) }
		it { is_expected.to have_many(:walkers).through(:walks) }
	end
end
