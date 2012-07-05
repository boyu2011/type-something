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
