class User < ActiveRecord::Base
	validates :fist_name, presence: true
	validates :last_name, presence: true
	validate  :is_valid_cc_number

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable

	has_one :address
	has_many :dogs
	has_many :walkers, through: :comments

  	private

  	def passes_luhn_test(credit_card)
		# Clean the card number- remove dashes and spaces
		credit_card.gsub!('-','').gsub!(' ' , '')

		# Convert card number into digits array
		digits = credit_card.split('').map { |e| e.to_int }

		# Luhn Algorithm
		# Adapted from code availabe on Wikipedia at
		# http://en.wikipedia.org/wiki/Luhn_algorithm
		sum = 0
		alt = false

		digits.each do |digit|
			if alt
				digit *= 2
				if digit > 9
					digit -= 9
				end
			end
			sum += digit
			alt = !alt
		end

		# If Mod 10 equals 0, the number is good and this will return true
		sum % 10 == 0
	end

  	def is_valid_cc_number
		card_regex = /^(?:
					  (?<visa>4[0-9]{12}(?:[0-9]{3})?) |
					  (?<mastercard>5[1-5][0-9]{14}) |
					  (?<discover>6(?:011|5[0-9]{2})[0-9]{12}) |
					  (?<amex>3[47][0-9]{13}) |
					  (?<diners>3(?:0[0-5]|[68][0-9])[0-9]{11}) |
					  (?<jcb>(?:2131|1800|35[0-9]{3})[0-9]{11})
					 )$/


		# Create new instance of Regex comparer with our credit card regex pattern
		#cardTest = Regexp.new(card_regex)

		# Make sure the supplied number matches the supplied card type
		if (card_regex.match(:credit_card)[:credit_card_type])
			# If the card type matches the number, then run it through Luhn's test to make sure the number appears correct
        	if (passes_luhn_test(:credit_card))
            	return true
        	else
				# The card fails Luhn's test
				return false
			end
		else
			# The card number does not match the card type
			return false
	 	end
	end
end
