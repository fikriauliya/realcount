require 'test_helper'

class TpsControllerTest < ActionController::TestCase
  setup do
    @tp = tps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tp" do
    assert_difference('Tps.count') do
      post :create, tp: { desa: @tp.desa, kelurahan_id: @tp.kelurahan_id, tps_id: @tp.tps_id }
    end

    assert_redirected_to tp_path(assigns(:tp))
  end

  test "should show tp" do
    get :show, id: @tp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tp
    assert_response :success
  end

  test "should update tp" do
    patch :update, id: @tp, tp: { desa: @tp.desa, kelurahan_id: @tp.kelurahan_id, tps_id: @tp.tps_id }
    assert_redirected_to tp_path(assigns(:tp))
  end

  test "should destroy tp" do
    assert_difference('Tps.count', -1) do
      delete :destroy, id: @tp
    end

    assert_redirected_to tps_index_path
  end
end
