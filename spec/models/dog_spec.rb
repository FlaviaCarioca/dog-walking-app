require 'rails_helper'

RSpec.describe Dog, :type => :model do
	it { should validate_presence_of(:name) }

	it { should ensure_length_of(:name).is_at_most(100) }
end
