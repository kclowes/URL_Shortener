require 'spec_helper'
require 'capybara/rspec'
require_relative("../app")

Capybara.app = App

feature 'Creating URL Shortener' do
  scenario "User goes to the url" do
    visit("/")
    expect(page).to have_button("Shorten")
    expect(page).to have_field('url_to_be_shortened')
    fill_in("url_to_be_shortened", :with => 'http://google.com')
    click_on("Shorten")
    expect(page).to have_content('Original URL')
    expect(page).to have_content('"Shortened" URL')
    expect(page).to have_content('http://google.com')
    expect(page).to have_content('http://lit-river-4368.herokuapp.com/1') # Heroku staging URL
    click_on('"Shorten" another URL')
    expect(page).to have_field('url_to_be_shortened')
  end
end




