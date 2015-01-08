require 'rails_helper'

RSpec.describe Dog, :type => :model do
	context 'validations' do
		it { should validate_presence_of(:name) }
		it { should ensure_length_of(:name).is_at_most(100) }
	end

	context 'expectations' do
		it { should belong_to(:user) }
		it { should have_many(:walkers).through(:walks) }
	end
end
