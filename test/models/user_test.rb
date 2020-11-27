require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '`full_name` returns the capitalized full name of the user' do
    user = User.new(first_name: 'John', last_name: 'Lennon')
    assert_equal 'John Lennon', user.full_name
    # => TRUE or FALSE
  end
end
