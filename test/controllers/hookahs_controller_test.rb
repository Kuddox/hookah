require 'test_helper'

class HookahsControllerTest < ActionController::TestCase
  setup do
    @hookah = hookahs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hookahs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hookah" do
    assert_difference('Hookah.count') do
      post :create, hookah: { description: @hookah.description, title: @hookah.title }
    end

    assert_redirected_to hookah_path(assigns(:hookah))
  end

  test "should show hookah" do
    get :show, id: @hookah
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hookah
    assert_response :success
  end

  test "should update hookah" do
    patch :update, id: @hookah, hookah: { description: @hookah.description, title: @hookah.title }
    assert_redirected_to hookah_path(assigns(:hookah))
  end

  test "should destroy hookah" do
    assert_difference('Hookah.count', -1) do
      delete :destroy, id: @hookah
    end

    assert_redirected_to hookahs_path
  end
end
