require 'spec_helper'
require 'capybara/rspec'
require_relative("../app")

Capybara.app = App

feature 'Creating URL Shortener' do
  scenario "User goes to the url" do
    visit("/")
    expect(page).to have_button("Shorten")
  end
end

#  scenario 'User sees a text field with explanatory placeholder text'
#
#
#      expect(page).to have_content("")
#
#  scenario 'User sees a "shorten" button'
#
#end