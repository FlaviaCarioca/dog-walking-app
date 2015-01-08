require 'rails_helper'

RSpec.describe Walk, :type => :model do
	context 'associations' do
		it { should belong_to(:dog) }
		it { should belong_to(:walker) }
	end
end
