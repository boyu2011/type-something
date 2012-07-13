namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_posts
		make_relationships
	end
end

def make_users
	admin = User.create!(name: 		"Bo Yu(admin)",
					 	 email:     "boyu2011@gmail.com",
					 	 password:  "123456",
					 	 password_confirmation: "123456")
	admin.toggle!(:admin)

	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@typesomething.com"
		password = "123456"
		User.create!(name: name,
					 email: email,
					 password: password,
					 password_confirmation: password)
	end
end

def make_posts
	users = User.all(limit: 6)
	50.times do
		content = Faker::Lorem.sentence(5)
		users.each do |user|
			user.posts.create!(content: content)
		end
	end
end

def make_relationships
	users = User.all
	user = users.first
	followed_users = users[2..50]
	followers = users[3..40]
	followed_users.each { |followed| user.follow!(followed) }
	folloers.each { |follower| follower.follow!(user) }
end

		