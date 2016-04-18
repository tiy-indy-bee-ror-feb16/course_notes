require 'test_helper'

class GifTest < ActiveSupport::TestCase
  def setup
    @gif = Gif.new(image_url: 'http://i.giphy.com/g5KhmX06Q0XBu.gif')
    @user = User.create!(username: 'tester', email: 'e@example.com', password: '12345678')
    @gif.user = @user
  end

  def test_gifs_should_belong_to_users
    assert @gif.save
    assert @gif.reload.user == @user
    assert @user.gifs.include?(@gif)
  end

  def test_tag_names_equal_works_with_comma_separated_string
    @gif.tag_names = "howdy, hey, hi"
    assert @gif.tags.length == 3
    assert @gif.tag_names == 'howdy, hey, and hi'
  end

  def test_tag_names_equal_works_with_array
    @gif.tag_names = %w(iu purdue bsu nd)
    assert @gif.tags.length == 4
    assert @gif.tag_names == 'iu, purdue, bsu, and nd'
  end

  def test_a_gif_is_taggable
    @gif.tag_with("this, that, another")
    @gif.save!
    assert @gif.tag_names == 'this, that, and another'
  end

  def test_tags_overwrite
    @gif.tag_with("this, that, another")
    @gif.save!
    @gif.tag_with("wvu, marshall")
    @gif.save!
    assert @gif.tags.length == 2
  end

end
