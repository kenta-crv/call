require 'test_helper'

class SfasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sfas_index_url
    assert_response :success
  end

end
