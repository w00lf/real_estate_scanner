require 'test_helper'

class UserTokenControllerTest < ActionDispatch::IntegrationTest
  TOKEN_ENDPOINT = '/user_token'

  def valid_params(login, password)
    {
      auth: {
        login: login,
        password: password
      }
    }
  end

  test 'Requires authorization' do
    password = 'qwerty'
    user = create(:user, password: password, password_confirmation: password)
    post(TOKEN_ENDPOINT, params: valid_params(user.login, password))
    assert_response(:success)
  end

  test 'Authorization with invalid params' do
    password = 'qwerty'
    user = create(:user, password: password, password_confirmation: password)
    post(TOKEN_ENDPOINT, params: valid_params(user.login, (password  + 'qwerty')))
    assert_response(:not_found)
  end
end
