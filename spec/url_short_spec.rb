require 'spec_helper'
require 'capybara/rspec'
require_relative("../app")

Capybara.app = App

feature 'Creating URL Shortener' do
  scenario "User goes to the url" do
    visit("/")
    expect(page).to have_button("Shorten")
    expect(page).to have_field("url_to_be_shortened")
  end


end
