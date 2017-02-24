require 'test_helper'

class UserTest < ActiveSupport::TestCase
	test 'Shuld have valid fixture' do
	  user = build(:user)
	  assert(user.valid?)
	end

	%w(name login password).each do |attribute|
		test "Should not save without attribute #{attribute}" do
		  user = build(:user, attribute => nil)
		  assert_not(user.save)
		end
	end
end
