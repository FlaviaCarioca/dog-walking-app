require 'rails_helper'

RSpec.describe Level, :type => :model do
	context 'associations' do
		it { should have_many(:walkers) }
	end
end
