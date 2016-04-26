require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      username: 'tester',
      email: 'e@example.com',
      password: 'password'
    )
  end

  def test_user_must_have_password
    @user.password = nil
    refute @user.save
    @user.password = "password"
    assert @user.save
  end

  def test_user_must_have_email
    @user.email = nil
    refute @user.save
    @user.email = 'e@example.com'
    assert @user.save
  end

  def test_user_email_must_be_valid
    @user.email = "sgre5rhdhre"
    refute @user.save
    @user.email = "e.f-pl@example.church"
    assert @user.save
  end

  def test_user_must_have_username
    @user.username = nil
    refute @user.save
    @user.username = 'tester'
    assert @user.save
  end

  def test_username_should_be_in_intended_format
    @user.username = "my awesome username..?+&"
    refute @user.save
    @user.username = "I'mAwesome andYou'reAwesometoo"
    refute @user.save
  end

end
