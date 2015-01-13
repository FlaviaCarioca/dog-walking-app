require 'rails_helper'

RSpec.describe Walk, :type => :model do
	context 'associations' do
		it { is_expected.to belong_to(:dog) }
		it { is_expected.to belong_to(:walker) }
	end
end
