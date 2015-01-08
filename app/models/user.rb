class User < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :credit_card, presence: true
	validates :credit_card_type, presence: true

	validate  :is_valid_cc_number, on: :create

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

	has_one :address, dependent: :destroy
	has_many :dogs
	has_many :walkers, through: :comments

  	def passes_luhn_test(credit_card)
		odd_sum = even_sum = 0

		credit_card.reverse.chars.each_slice(2) do |odd, even|
			odd_sum += odd.to_i
			double = even.to_i * 2
			double -= 9 if double >= 10
			even_sum += double
		end

		(odd_sum + even_sum) % 10 == 0
	end

  	def is_valid_cc_number
		card_regex = /^(?:(?<visa>4[0-9]{12}(?:[0-9]{3})?)|(?<mastercard>5[1-5][0-9]{14})|(?<discover>6(?:011|5[0-9]{2})[0-9]{12})|(?<amex>3[47][0-9]{13})|(?<diners>3(?:0[0-5]|[68][0-9])[0-9]{11})|(?<jcb>(?:2131|1800|35[0-9]{3})[0-9]{11}))$/

		# keep the numeric characters only
		cc_number = self.credit_card.gsub(/\D/, '')

		# Make sure the supplied number matches the supplied card type
		if (card_regex.match(cc_number)[self.credit_card_type.downcase])
			# If the card type matches the number, then run it through Luhn's test to make sure the number appears correct
        	if (!passes_luhn_test(cc_number))
            	errors.add(:credit_card, 'is invalid')
			end
		else
			errors.add(:credit_card, 'number and type do not match')
		end
	end
end
