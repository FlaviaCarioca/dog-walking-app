require 'rails_helper'

RSpec.describe Comment, :type => :model do
	context 'associatons' do
		it { should belong_to(:user) }
		it { should belong_to(:walker) }
	end
end
