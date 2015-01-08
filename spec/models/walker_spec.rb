require 'rails_helper'

RSpec.describe Walker, :type => :model do
  context 'associations' do
	  it { should belong_to(:level) }
	  it { should have_one(:address).dependent(:destroy) }
	  it { should have_many(:dogs).through(:walks) }
	  it { should have_many(:users).through(:comments) }
  end
end
