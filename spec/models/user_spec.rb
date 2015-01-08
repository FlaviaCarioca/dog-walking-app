require 'rails_helper'

RSpec.describe User, :type => :model do

	context 'associations' do
		it { should have_one(:address).dependent(:destroy) }
		# it { should have_many(:walkers) }
		# it { should have_many(:dogs) }
	end

	context 'validations' do
		it 'validates presence of first name ' do
			 build_default_user
			 expect(@user).to validate_presence_of(:first_name)
		end

		it 'validates presence of last name ' do
			build_default_user
			expect(@user).to validate_presence_of(:last_name)
		end

		it 'validates presence of credit card' do
			 build_default_user
			 expect(@user).to validate_presence_of(:credit_card)
		end

		it 'validates presence of credit card type' do
			 build_default_user
			 expect(@user).to validate_presence_of(:credit_card_type)
		end

		# Sample CC numbers come from http://www.freeformatter.com/credit-card-number-generator-validator.html
		context 'credit card' do
			it 'is valid mastercard' do
				@user = FactoryGirl.build(:user, credit_card: '5201-1964-9220-4971', credit_card_type: 'mastercard')
				expect(@user).to be_valid
			end

			it 'is valid visa' do
				@user = FactoryGirl.build(:user, credit_card: '4897-4436-9960-4906', credit_card_type: 'Visa')
				expect(@user).to be_valid
			end

			it 'is valid discover' do
				@user = FactoryGirl.build(:user, credit_card: '6011639062942338', credit_card_type: 'DISCOVER')
				@user.save
				expect(@user).to be_valid
			end

			it 'is valid amex' do
				@user = FactoryGirl.create(:user, credit_card: '3457-9832-6549-295', credit_card_type: 'amex')
				expect(@user).to be_valid
			end

			it 'is valid diners' do
				# the funky case is on purpose to make sure any that any casing funkiness the user inputs will pass
				@user = FactoryGirl.create(:user, credit_card: '3058-5937-2133-99', credit_card_type: 'DIners')
				expect(@user).to be_valid
			end

			it 'is valid jcb' do
				@user = FactoryGirl.build(:user, credit_card: '3566 1111 1111 1113', credit_card_type: 'jcb')
				expect(@user).to be_valid
			end

			it 'is invalid - wrong type number combination' do
				@user = FactoryGirl.build(:user, credit_card: '3058-5937-2133-99', credit_card_type: 'amex')
				expect(@user).to_not be_valid
			end

			it 'is invalid - fails luhn algorithm' do
				@user = FactoryGirl.build(:user, credit_card: '4444-4444-4444-4444', credit_card_type: 'visa')
				expect(@user).to_not be_valid
			end
		end
	end

	def build_default_user
		@user = FactoryGirl.create(:user)
	end
end
