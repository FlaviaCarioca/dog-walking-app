require 'rails_helper'

RSpec.describe Comment, :type => :model do
	context 'associatons' do
		it { is_expected.to belong_to(:user) }
		it { is_expected.to belong_to(:walker) }
	end
end
