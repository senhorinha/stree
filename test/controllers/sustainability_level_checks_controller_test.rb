require 'test_helper'

class SustainabilityLevelChecksControllerTest < ActionController::TestCase
  setup do
    @sustainability_level_check = sustainability_level_checks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sustainability_level_checks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sustainability_level_check" do
    assert_difference('SustainabilityLevelCheck.count') do
      post :create, sustainability_level_check: { edifice_id: @sustainability_level_check.edifice_id, sustainability_level: @sustainability_level_check.sustainability_level }
    end

    assert_redirected_to sustainability_level_check_path(assigns(:sustainability_level_check))
  end

  test "should show sustainability_level_check" do
    get :show, id: @sustainability_level_check
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sustainability_level_check
    assert_response :success
  end

  test "should update sustainability_level_check" do
    patch :update, id: @sustainability_level_check, sustainability_level_check: { edifice_id: @sustainability_level_check.edifice_id, sustainability_level: @sustainability_level_check.sustainability_level }
    assert_redirected_to sustainability_level_check_path(assigns(:sustainability_level_check))
  end

  test "should destroy sustainability_level_check" do
    assert_difference('SustainabilityLevelCheck.count', -1) do
      delete :destroy, id: @sustainability_level_check
    end

    assert_redirected_to sustainability_level_checks_path
  end
end
