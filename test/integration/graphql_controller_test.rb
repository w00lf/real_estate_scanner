require 'test_helper'

class GraphqlControllerTest < ActionDispatch::IntegrationTest
  GRAPHQL_ENDPOINT = '/graphql'

  def authenticated_header
    token = Knock::AuthToken.new(payload: { sub: create(:user).id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  def source
    @source ||= create(:source)
  end

  def valid_params
    { query: File.read(Rails.root.join('test/fixtures/source_payload.txt')) % source.api_key.id }
  end

  test 'Requires authorization' do
    post(GRAPHQL_ENDPOINT, params: valid_params)
    assert_response(:unauthorized)
  end

  test 'Return 200 OK if jwt headers supplied' do
    post(GRAPHQL_ENDPOINT, params: valid_params, headers: authenticated_header)
    assert_response(:success)
  end
end
