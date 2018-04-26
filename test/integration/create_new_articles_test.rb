require 'test_helper'

class CreateNewArticlesTest < ActionDispatch::IntegrationTest
  
  def setup
  @user = User.create(username: "Miles", email: "milesn@miles.com", password: "password")
  end
  
  test "get new article test" do
    sign_in_as(@user,"password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "test", description: "hello world", user_id: 33} }
      follow_redirect!
    end
    assert_template 'articles/show'
    assert_match "test", response.body
  end
end
