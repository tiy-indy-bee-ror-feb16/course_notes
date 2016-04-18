require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest

  def setup
    25.times do
      create(:gif)
    end
  end

  def test_root_loads_gifs
    visit('/')
    assert page.all('img', count: 24)
  end

  def test_should_be_paginated
    visit(root_path)
    assert page.has_selector?('nav.pagination')
  end

  def test_pagination_should_be_remote
    Capybara.current_driver = Capybara.javascript_driver
    visit(root_path)
    page.first('.pagination .next a').click
    assert current_path == root_path
  end

  def test_pagination_loads_new_images
    Capybara.current_driver = Capybara.javascript_driver
    visit(root_path)
    page.first('.pagination .next a').click
    first_gif = Gif.offset(24).limit(1).first
    assert page.first('#gif_grid img')['src'] == first_gif.image_url
  end
end
