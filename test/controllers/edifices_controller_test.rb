require 'test_helper'

class EdificesControllerTest < ActionController::TestCase
  setup do
    @edifice = edifices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:edifices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create edifice" do
    assert_difference('Edifice.count') do
      post :create, edifice: { last_update_of_sustainability_level: @edifice.last_update_of_sustainability_level, name: @edifice.name, sustainability_level: @edifice.sustainability_level }
    end

    assert_redirected_to edifice_path(assigns(:edifice))
  end

  test "should show edifice" do
    get :show, id: @edifice
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @edifice
    assert_response :success
  end

  test "should update edifice" do
    patch :update, id: @edifice, edifice: { last_update_of_sustainability_level: @edifice.last_update_of_sustainability_level, name: @edifice.name, sustainability_level: @edifice.sustainability_level }
    assert_redirected_to edifice_path(assigns(:edifice))
  end

  test "should destroy edifice" do
    assert_difference('Edifice.count', -1) do
      delete :destroy, id: @edifice
    end

    assert_redirected_to edifices_path
  end
end
