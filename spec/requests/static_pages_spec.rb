require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do
		it "should have the h1 'Type Something App'" do
			visit '/static_pages/home'
			page.should have_selector('h1', :text => 'Type Something App')
		end

		it "should have the title 'Home'" do
			visit '/static_pages/home'
			page.should have_selector('title', :text => 'Type Something | Home')
		end
	end

	describe "Help page" do
		it "should have the h1 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('h1', :text => 'Help')
		end

		it "should have the title 'Help'" do
			visit '/static_pages/help'
			page.should have_selector('title', :text => 'Type Something | Help')
		end
	end

end
