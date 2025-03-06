require "test_helper"

class ErrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @errand = errands(:one)
  end

  test "should get index" do
    get errands_url
    assert_response :success
  end

  test "should get new" do
    get new_errand_url
    assert_response :success
  end

  test "should create errand" do
    assert_difference("Errand.count") do
      post errands_url, params: { errand: { category: @errand.category, location: @errand.location } }
    end

    assert_redirected_to errand_url(Errand.last)
  end

  test "should show errand" do
    get errand_url(@errand)
    assert_response :success
  end

  test "should get edit" do
    get edit_errand_url(@errand)
    assert_response :success
  end

  test "should update errand" do
    patch errand_url(@errand), params: { errand: { category: @errand.category, location: @errand.location } }
    assert_redirected_to errand_url(@errand)
  end

  test "should destroy errand" do
    assert_difference("Errand.count", -1) do
      delete errand_url(@errand)
    end

    assert_redirected_to errands_url
  end
end
