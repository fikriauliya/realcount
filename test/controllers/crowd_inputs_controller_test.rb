require 'test_helper'

class CrowdInputsControllerTest < ActionController::TestCase
  setup do
    @crowd_input = crowd_inputs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crowd_inputs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crowd_input" do
    assert_difference('CrowdInput.count') do
      post :create, crowd_input: { broken_count: @crowd_input.broken_count, jokowi_count: @crowd_input.jokowi_count, prabowo_count: @crowd_input.prabowo_count, problem: @crowd_input.problem, tps_id: @crowd_input.tps_id, user_id: @crowd_input.user_id }
    end

    assert_redirected_to crowd_input_path(assigns(:crowd_input))
  end

  test "should show crowd_input" do
    get :show, id: @crowd_input
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @crowd_input
    assert_response :success
  end

  test "should update crowd_input" do
    patch :update, id: @crowd_input, crowd_input: { broken_count: @crowd_input.broken_count, jokowi_count: @crowd_input.jokowi_count, prabowo_count: @crowd_input.prabowo_count, problem: @crowd_input.problem, tps_id: @crowd_input.tps_id, user_id: @crowd_input.user_id }
    assert_redirected_to crowd_input_path(assigns(:crowd_input))
  end

  test "should destroy crowd_input" do
    assert_difference('CrowdInput.count', -1) do
      delete :destroy, id: @crowd_input
    end

    assert_redirected_to crowd_inputs_path
  end
end
