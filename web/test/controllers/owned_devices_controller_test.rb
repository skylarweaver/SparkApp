require 'test_helper'

class OwnedDevicesControllerTest < ActionController::TestCase
  setup do
    @owned_device = owned_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:owned_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create owned_device" do
    assert_difference('OwnedDevice.count') do
      post :create, owned_device: { device_id: @owned_device.device_id, personal_device_name: @owned_device.personal_device_name, user_id: @owned_device.user_id }
    end

    assert_redirected_to owned_device_path(assigns(:owned_device))
  end

  test "should show owned_device" do
    get :show, id: @owned_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @owned_device
    assert_response :success
  end

  test "should update owned_device" do
    patch :update, id: @owned_device, owned_device: { device_id: @owned_device.device_id, personal_device_name: @owned_device.personal_device_name, user_id: @owned_device.user_id }
    assert_redirected_to owned_device_path(assigns(:owned_device))
  end

  test "should destroy owned_device" do
    assert_difference('OwnedDevice.count', -1) do
      delete :destroy, id: @owned_device
    end

    assert_redirected_to owned_devices_path
  end
end
