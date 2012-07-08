# this file will be automatically get loaded by RSpec.
FactoryGirl.define do
	factory :user do
		sequence(:name)			{ |n| "User #{n}" }
		sequence(:email)		{ |n| "user-#{n}@typesomething.com" }
		password				"foobar"
		password_confirmation	"foobar"
	
		factory :admin do
			admin true
		end
	end
end