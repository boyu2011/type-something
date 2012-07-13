require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do

		before { visit home_path }

		it "should have the h2 'Type Something App'" do
			page.should have_selector('h2', :text => 'Type Something App')
		end

		it "should have the title 'Home'" do
			page.should have_selector('title', :text => 'Type Something | Home')
		end

		describe "for signed-in users" do

			let(:user) { FactoryGirl.create(:user) }

			before do
				FactoryGirl.create(:post, user: user, content: "Ruby is amazing")
				FactoryGirl.create(:post, user: user, content: "Java is good")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					page.should have_selector("li##{item.id}", text: item.content)
				end
			end

			describe "following/follower counts" do
				
				let(:other_user) { FactoryGirl.create(:user) }

				before do
					other_user.follow!(user)
					visit root_path
				end

				it { page.should have_link("0 following", href: following_user_path(user)) }
				it { page.should have_link("1 followers", href: followers_user_path(user)) }
			end
		end
	end

	describe "Help page" do
		before { visit help_path }

		it "should have the h1 'Help'" do
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the title 'Help'" do
			page.should have_selector('title', :text => 'Type Something | Help')
		end
	end

	describe "About page" do
		before { visit about_path }

		it "should have the h1 'About'" do
			page.should have_selector('h1', text: 'About')
		end

		it "should have the title 'About'" do
			page.should have_selector('title',
							text: 'Type Something | About')
		end
	end

	describe "Contact page" do
		before { visit contact_path }
		subject { page }

		it { should have_selector('h1', text: 'Contact') }

		it { should have_selector('title', text: "Type Something | Contact") }
	end
end
