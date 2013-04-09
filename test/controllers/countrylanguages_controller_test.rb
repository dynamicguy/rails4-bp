require 'test_helper'

class CountrylanguagesControllerTest < ActionController::TestCase
  setup do
    @countrylanguage = countrylanguages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:countrylanguages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create countrylanguage" do
    assert_difference('Countrylanguage.count') do
      post :create, countrylanguage: { countrycode: @countrylanguage.countrycode, isofficial: @countrylanguage.isofficial, language: @countrylanguage.language, percentage: @countrylanguage.percentage }
    end

    assert_redirected_to countrylanguage_path(assigns(:countrylanguage))
  end

  test "should show countrylanguage" do
    get :show, id: @countrylanguage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @countrylanguage
    assert_response :success
  end

  test "should update countrylanguage" do
    patch :update, id: @countrylanguage, countrylanguage: { countrycode: @countrylanguage.countrycode, isofficial: @countrylanguage.isofficial, language: @countrylanguage.language, percentage: @countrylanguage.percentage }
    assert_redirected_to countrylanguage_path(assigns(:countrylanguage))
  end

  test "should destroy countrylanguage" do
    assert_difference('Countrylanguage.count', -1) do
      delete :destroy, id: @countrylanguage
    end

    assert_redirected_to countrylanguages_path
  end
end
