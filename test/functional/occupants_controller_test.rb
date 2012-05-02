require 'test_helper'

class OccupantsControllerTest < ActionController::TestCase
  setup do
    @occupant = occupants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:occupants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create occupant" do
    assert_difference('Occupant.count') do
      post :create, occupant: @occupant.attributes
    end

    assert_redirected_to occupant_path(assigns(:occupant))
  end

  test "should show occupant" do
    get :show, id: @occupant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @occupant
    assert_response :success
  end

  test "should update occupant" do
    put :update, id: @occupant, occupant: @occupant.attributes
    assert_redirected_to occupant_path(assigns(:occupant))
  end

  test "should destroy occupant" do
    assert_difference('Occupant.count', -1) do
      delete :destroy, id: @occupant
    end

    assert_redirected_to occupants_path
  end
end
