require 'test_helper'

class SeriesItemsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => SeriesItem.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    SeriesItem.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    SeriesItem.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to series_item_url(assigns(:series_item))
  end

  def test_edit
    get :edit, :id => SeriesItem.first
    assert_template 'edit'
  end

  def test_update_invalid
    SeriesItem.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SeriesItem.first
    assert_template 'edit'
  end

  def test_update_valid
    SeriesItem.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SeriesItem.first
    assert_redirected_to series_item_url(assigns(:series_item))
  end

  def test_destroy
    series_item = SeriesItem.first
    delete :destroy, :id => series_item
    assert_redirected_to series_items_url
    assert !SeriesItem.exists?(series_item.id)
  end
end
