FactoryGirl.define do
	factory :user do
		first_name 'Ana'
		last_name 'Banana'
		email 'ana@banana.com'
		password 'password123!'
		credit_card '5201-1964-9220-4971'
		credit_card_type 'mastercard'
		address_id 1
	end

	factory :address do
		street_address '221 Market St'
		state_abbrv 'CA'
		city 'San Francisco'
		zip_code '94110'
	end
end
