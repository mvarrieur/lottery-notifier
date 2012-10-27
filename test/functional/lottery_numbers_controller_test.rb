require 'test_helper'

class LotteryNumbersControllerTest < ActionController::TestCase
  setup do
    @lottery_number = lottery_numbers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lottery_numbers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lottery_number" do
    assert_difference('LotteryNumber.count') do
      post :create, lottery_number: { draw_date: @lottery_number.draw_date, link: @lottery_number.link, next_draw: @lottery_number.next_draw, winning_number: @lottery_number.winning_number }
    end

    assert_redirected_to lottery_number_path(assigns(:lottery_number))
  end

  test "should show lottery_number" do
    get :show, id: @lottery_number
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lottery_number
    assert_response :success
  end

  test "should update lottery_number" do
    put :update, id: @lottery_number, lottery_number: { draw_date: @lottery_number.draw_date, link: @lottery_number.link, next_draw: @lottery_number.next_draw, winning_number: @lottery_number.winning_number }
    assert_redirected_to lottery_number_path(assigns(:lottery_number))
  end

  test "should destroy lottery_number" do
    assert_difference('LotteryNumber.count', -1) do
      delete :destroy, id: @lottery_number
    end

    assert_redirected_to lottery_numbers_path
  end
end
