require 'rails_helper'

RSpec.describe Level, :type => :model do
	context 'associations' do
		it { is_expected.to have_many(:walkers) }
	end
end
