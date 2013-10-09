require 'spec_helper'

feature 'Create an album' do
  scenario 'with valid input' do
    create_and_sign_in_user
    click_on 'Create an album'
    fill_in 'Name', :with => "Kittens"
    click_button "submit"
    page.should have_content "Kittens"
  end

  scenario 'without valid input' do
    create_and_sign_in_user
    click_on 'Create an album'
    click_button 'submit'
    page.should have_content 'wrong'
  end
end

feature 'viewing an album' do
  scenario 'clicked on album name' do
    user = create_and_sign_in_user
    album = FactoryGirl.create(:album, :user => user)
    visit "/users/#{user.id}"
    click_on album.name
    page.should have_content 'kittens'
  end
end
