# this file will be automatically get loaded by RSpec.
FactoryGirl.define do
	factory :user do
		name					"Bo Yu"
		email					"boyu@example.com"
		password				"foobar"
		password_confirmation	"foobar"
	end
end