require 'test_helper'

class ParksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @park = parks(:one)
  end

  test "should get index" do
    get parks_url
    assert_response :success
  end

  test "should get new" do
    get new_park_url
    assert_response :success
  end

  test "should create park" do
    assert_difference('Park.count') do
      post parks_url, params: { park: { floor: @park.floor, name: @park.name, number: @park.number, phone: @park.phone } }
    end

    assert_redirected_to park_url(Park.last)
  end

  test "should show park" do
    get park_url(@park)
    assert_response :success
  end

  test "should get edit" do
    get edit_park_url(@park)
    assert_response :success
  end

  test "should update park" do
    patch park_url(@park), params: { park: { floor: @park.floor, name: @park.name, number: @park.number, phone: @park.phone } }
    assert_redirected_to park_url(@park)
  end

  test "should destroy park" do
    assert_difference('Park.count', -1) do
      delete park_url(@park)
    end

    assert_redirected_to parks_url
  end
end
