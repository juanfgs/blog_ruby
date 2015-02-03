require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "saves hashed password" do
    User.find_each do |user|
      assert_respond_to user.password, :is_password?, "Is a password "
    end
  end


end
