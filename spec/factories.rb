FactoryGirl.define do
	factory :user do
		first_name 'Ana'
		last_name 'Banana'
		email 'ana@banana.com'
		password 'password123!'
		credit_card '5201-1964-9220-4971'
		credit_card_type 'mastercard'
	end

	factory :address do
		street_name '221 Market St'
		state_abbrv 'CA'
		city 'San Francisco'
		zip_code '94110'
		user
	end

	factory :dog do
		name 'Fido'
		user
	end

	factory :walker do
		first_name 'Walker'
		last_name 'One'
		price 25.00
		level
	end

	factory :walk do
		time 13
		date '01/25/15'
		dog
		walker
	end

	factory :level do
		name 'Beginner'
		number_of_dogs 5
	end

	factory :comment do
		comment 'this is an example of a comment'
		user
		walker
	end


end
