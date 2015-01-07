require 'rails_helper'

RSpec.describe User, :type => :model do

	before(:each) do
		#@user = FactoryGirl.create(:user)
	end

	# it { should validate_presence_of(:first_name) }
	# it { should validate_presence_of(:last_name) }
	# it { should validate_presence_of(:credit_card) }
	# it { should validate_presence_of(:credit_card_type) }


	context 'credit card' do
		it 'is valid mastercard' do
			@user = FactoryGirl.create(:user)
			# @user.credit_card = '5201-1964-9220-4971'
			# @user.credit_card_type = 'mastercard'
			@user.save
			expect(@user).to be_valid
		end

		it 'is valid visa' do
			@user = FactoryGirl.create(:user, credit_card: '4897-4436-9960-4906', credit_card_type: 'Visa')
			@user.save
			expect(@user).to be_valid
		end

		it 'is valid discover' do
			@user = FactoryGirl.create(:user, credit_card: '6011-6390-6294-2338', credit_card_type: 'DISCOVER')
			@user.save
			expect(@user).to be_valid
		end

		it 'is valid amex' do
			@user = FactoryGirl.create(:user, credit_card: '3457-9832-6549-295', credit_card_type: 'amex')
			@user.save
			expect(@user).to be_valid
		end

		it 'is valid diners' do
			# the funky case is on purpose to make sure any that any casing funkiness the user inputs will pass
			@user = FactoryGirl.create(:user, credit_card: '3058-5937-2133-99', credit_card_type: 'DIners')
			@user.save
			expect(@user).to be_valid
		end

		# it 'is valid jcb' do
		# 	@user = FactoryGirl.create(:user, credit_card: '3337-00452-2230-960', credit_card_type: 'jcb')
		# 	@user.save
		# 	expect(@user).to be_valid
		# end

		# it 'is invalid - wrong type number combination' do
		# 	@user = FactoryGirl.create(:user, credit_card: '3337-00452-2230-960', credit_card_type: 'amex')
		# 	@user.save
		# 	expect(@user).to_not be_valid
		# end

		# it 'is invalid - fails luhn algorithm' do
		# 	@user = FactoryGirl.create(:user, credit_card: '4111-1111-1111-1111', credit_card_type: 'visa')
		# 	@user.save
		# 	expect(@user).to_not be_valid
		# end
	end
end
