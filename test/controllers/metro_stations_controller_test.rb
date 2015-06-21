require 'test_helper'

class MetroStationsControllerTest < ActionController::TestCase
  setup do
    @metro_station = metro_stations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:metro_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create metro_station" do
    assert_difference('MetroStation.count') do
      post :create, metro_station: {  }
    end

    assert_redirected_to metro_station_path(assigns(:metro_station))
  end

  test "should show metro_station" do
    get :show, id: @metro_station
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @metro_station
    assert_response :success
  end

  test "should update metro_station" do
    patch :update, id: @metro_station, metro_station: {  }
    assert_redirected_to metro_station_path(assigns(:metro_station))
  end

  test "should destroy metro_station" do
    assert_difference('MetroStation.count', -1) do
      delete :destroy, id: @metro_station
    end

    assert_redirected_to metro_stations_path
  end
end
