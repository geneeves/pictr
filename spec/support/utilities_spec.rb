def create_and_sign_in_user
  user = FactoryGirl.create(:user)
  visit '/users/sign_in'
  fill_in "Email", :with => user.email
  fill_in "Password", :with => user.password
  click_button "Sign in"
  return user
end