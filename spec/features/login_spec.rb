require 'spec_helper'

feature "the signup process" do
  scenario "signs me in" do
    visit root_path
    fill_in 'Email', :with => 'maureen@growthaccelerationpartners.com'
    fill_in 'Password', :with => 'Asdf1234!'
    click_button 'Sign in'
    page.should have_content 'Signed in successfully.'
  end
end