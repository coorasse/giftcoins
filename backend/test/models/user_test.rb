require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#from_google" do
    user_info = mock(emails: [mock(value: 'email')],
                     display_name: 'name',
                     image: mock(url: 'image_url'),
                     id: 'google_id')
    user = User.from_google(user_info)
    assert_equal user.email, 'email'
    assert_equal user.name, 'name'
    assert_equal user.image_url, 'image_url'
    assert_equal user.google_id, 'google_id'
    # user2 = User.from_google(user_info)
    # assert_equal user, user2
  end
end
