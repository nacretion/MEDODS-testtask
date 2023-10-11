require "test_helper"

class MedicationsControllerTest < ActionDispatch::IntegrationTest
  test 'should search for drugs by query' do
    get medications_search_drug_url(query: 'aspirin')
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_not_empty response_data
  end

  test 'should search for drugs by reactionmeddrapt' do
    get medications_search_by_reactionmeddrapt_url(query: 'fatigue')
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_not_empty response_data
  end
end
