require 'test_helper'

class ReadControllerTest < ActionController::TestCase
  test "should get books" do
    get :books
    assert_response :success
  end

end
