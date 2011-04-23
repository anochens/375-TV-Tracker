require 'test_helper'

class WatchedEpisodesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => WatchedEpisode.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    WatchedEpisode.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    WatchedEpisode.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to watched_episode_url(assigns(:watched_episode))
  end

  def test_edit
    get :edit, :id => WatchedEpisode.first
    assert_template 'edit'
  end

  def test_update_invalid
    WatchedEpisode.any_instance.stubs(:valid?).returns(false)
    put :update, :id => WatchedEpisode.first
    assert_template 'edit'
  end

  def test_update_valid
    WatchedEpisode.any_instance.stubs(:valid?).returns(true)
    put :update, :id => WatchedEpisode.first
    assert_redirected_to watched_episode_url(assigns(:watched_episode))
  end

  def test_destroy
    watched_episode = WatchedEpisode.first
    delete :destroy, :id => watched_episode
    assert_redirected_to watched_episodes_url
    assert !WatchedEpisode.exists?(watched_episode.id)
  end
end
