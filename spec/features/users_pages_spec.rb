require 'spec_helper'

feature "Signing in" do

  scenario "with correct information" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in" 
    page.should have_content 'Signed in as'
  end

  scenario "with incorrect information" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in'
    fill_in "Email", :with => user.email
    click_button "Sign in" 
    page.should have_content 'Invalid'
  end
end

feature "Signin up" do
  scenario "with valid inputs" do
    user = FactoryGirl.build(:user)
    visit '/users/sign_up'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    fill_in "Password confirmation", :with => user.password_confirmation
    click_button "Sign up" 
    page.should have_content 'Signed in as'
  end

  scenario "with no inputs" do
    user = FactoryGirl.build(:user)
    visit '/users/sign_up'
    click_button "Sign up" 
    page.should have_content 'blank'
  end

  scenario "with nonmatching" do
    user = FactoryGirl.build(:user)
    visit '/users/sign_up'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    fill_in "Password confirmation", :with => "foobar"
    click_button "Sign up" 
    page.should have_content 'match'
  end
end