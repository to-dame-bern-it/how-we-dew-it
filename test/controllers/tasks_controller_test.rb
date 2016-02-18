require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
    session[:user_id] = users(:one).id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    xhr :get, :new, :format => "js"
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      xhr :post, :create, :format => "js", task: { category_id: @task.category_id, description: @task.description, due_at: @task.due_at, name: @task.name, owner_task_id: @task.owner_task_id, position: @task.position, status_id: @task.status_id, user_id: @task.user_id }
    end
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    xhr :get, :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    xhr :patch, :update, id: @task, task: { category_id: @task.category_id, description: @task.description, due_at: @task.due_at, name: @task.name, owner_task_id: @task.owner_task_id, position: @task.position, status_id: @task.status_id, user_id: @task.user_id }
    assert_response :success
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      xhr :delete, :destroy, id: @task
    end
  end
end
