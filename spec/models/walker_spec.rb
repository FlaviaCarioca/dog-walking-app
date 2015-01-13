require 'rails_helper'

RSpec.describe Walker, :type => :model do
  context 'associations' do
	  it { is_expected.to belong_to(:level) }
	  it { is_expected.to have_one(:address).dependent(:destroy) }
	  it { is_expected.to have_many(:dogs).through(:walks) }
	  it { is_expected.to have_many(:users).through(:comments) }
  end
end
