require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @entry = @user.entries.build(title: " Lorem ipsum", body: "He is a scientist")
  end

  test "should be valid" do
    assert @entry.valid?
  end

  test "user id should be present" do
    @entry.user_id = nil
    assert_not @entry.valid?
  end

test "tilte should be present " do
    @entry.title = "   "
    assert_not @entry.valid?
  end

  test "title should be at most 140 characters" do
    @entry.title = "a" * 141
    assert_not @entry.valid?
  end

  test "body should be present " do
    @entry.body = "   "
    assert_not @entry.valid?
  end

  test "order should be most recent first" do
    assert_equal Entry.first, entries(:most_recent)
  end

  
  

end
