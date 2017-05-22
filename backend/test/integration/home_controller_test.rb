require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  def test_index
    get root_url
    assert_equal({ status: :ok }.to_json, response.body)
    assert_response :success
  end
end
