require 'test_helper'

class NewUserSignupTestTest < ActionDispatch::IntegrationTest
  
  test "get new category form and create category" do 
  get signup_path 
  assert_template 'users/new' 
  assert_difference 'User.count', 1 do 
  post users_path, params: { user: { username: "Miles", email: "miles@miles.com", password: "password" } } 
  follow_redirect! 
  end 
  assert_template 'users/show' 
  assert_match "Miles", response.body 
  end 
end 

