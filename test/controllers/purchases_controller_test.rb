require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get purchases_new_url
    assert_response :success
  end

end
