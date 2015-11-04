require 'test_helper'

class OwnedChargersControllerTest < ActionController::TestCase
  setup do
    @owned_charger = owned_chargers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owned_chargers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owned_charger" do
    assert_difference('OwnedCharger.count') do
      post :create, owned_charger: { charger_id: @owned_charger.charger_id, personal_charger_name: @owned_charger.personal_charger_name, user_id: @owned_charger.user_id }
    end

    assert_redirected_to owned_charger_path(assigns(:owned_charger))
  end

  test "should show owned_charger" do
    get :show, id: @owned_charger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owned_charger
    assert_response :success
  end

  test "should update owned_charger" do
    patch :update, id: @owned_charger, owned_charger: { charger_id: @owned_charger.charger_id, personal_charger_name: @owned_charger.personal_charger_name, user_id: @owned_charger.user_id }
    assert_redirected_to owned_charger_path(assigns(:owned_charger))
  end

  test "should destroy owned_charger" do
    assert_difference('OwnedCharger.count', -1) do
      delete :destroy, id: @owned_charger
    end

    assert_redirected_to owned_chargers_path
  end
end
