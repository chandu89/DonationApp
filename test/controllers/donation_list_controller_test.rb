require 'test_helper'

class DonationListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get donation_list_index_url
    assert_response :success
  end

end
