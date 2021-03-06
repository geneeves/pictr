require 'spec_helper'

feature "Adding a photo" do 

  scenario "with valid information" do
    user = create_and_sign_in_user
    album = FactoryGirl.create(:album, { user: user })
    visit album_path(album)
    click_on "Add a photo"
    fill_in "Image Name", :with => 'cute kitten'
    attach_file "Upload File", "spec/kitten.jpg"
    click_button "Upload"
    page.should have_content "cute kitten"
  end

end
