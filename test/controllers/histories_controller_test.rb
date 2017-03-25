require 'test_helper'

class HistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @history = histories(:one)
  end

  test "should get index" do
    assert_response :success
  end

  test "should get new" do
    assert_response :success
  end

  test "should create history" do
    assert_difference('History.count') do
      post create_history_url, params: { history: { end: @history.end, user_id: @history.user_id, room_id: @history.room_id, start: @history.slot } }
    end

    assert_redirected_to history_url(History.last)
  end

  test "should show room history" do
    get history_room_url(@history)
    assert_response :success
  end

  test "should show user history" do
    get history_user_url(@history)
    assert_response :success
  end

  test "should get edit" do
    get edit_history_url(@history)
    assert_response :success
  end

  test "should update history" do
    patch update_history_url(@history), params: { history: { end: @history.end, user_id: @history.user_id, room_id: @history.room_id, start: @history.slot } }
    assert_redirected_to update_history_url(@history)
  end

  test "should destroy history" do
    assert_difference('History.count', -1) do
      delete history_url(@history)
    end

    assert_redirected_to histories_url
  end
end
