require 'test_helper'

class JobListsControllerTest < ActionController::TestCase
  setup do
    @job_list = job_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_list" do
    assert_difference('JobList.count') do
      post :create, job_list: @job_list.attributes
    end

    assert_redirected_to job_list_path(assigns(:job_list))
  end

  test "should show job_list" do
    get :show, id: @job_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_list
    assert_response :success
  end

  test "should update job_list" do
    put :update, id: @job_list, job_list: @job_list.attributes
    assert_redirected_to job_list_path(assigns(:job_list))
  end

  test "should destroy job_list" do
    assert_difference('JobList.count', -1) do
      delete :destroy, id: @job_list
    end

    assert_redirected_to job_lists_path
  end
end
