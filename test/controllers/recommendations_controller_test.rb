require "test_helper"

class RecommendationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultation_request = consultation_requests(:one)
  end

  test 'should get index' do
    get recommendations_url
    assert_response :success
  end

  test 'should create recommendation' do
    valid_recommendation = { recommendation: { text: 'Sample recommendation text' } }

    assert_difference('Recomendation.count') do
      post consultation_request_recommendations_url(@consultation_request), params: valid_recommendation
    end

    assert_response :created
  end

  test 'should not create invalid recommendation' do
    invalid_recommendation = { recommendation: { text: '' } }

    assert_no_difference('Recomendation.count') do
      post consultation_request_recommendations_url(@consultation_request), params: invalid_recommendation
    end

    assert_response :unprocessable_entity
  end

  test 'should not create recommendation without consultation_request' do
    invalid_consultation_request_id = -1
    invalid_recommendation = { recommendation: { text: 'Recommendation text' } }

    assert_no_difference('Recomendation.count') do
      post consultation_request_recommendations_url(invalid_consultation_request_id), params: invalid_recommendation
    end

    assert_response :unprocessable_entity
  end

end
