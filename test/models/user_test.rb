require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end
test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end

test "associated entries should be destroyed" do
    @user.save
    @user.entries.create!(title: "Lorem ipsum", body: "He is a scientist")
    assert_difference 'Entry.count', -1 do
      @user.destroy
    end
  end
end
