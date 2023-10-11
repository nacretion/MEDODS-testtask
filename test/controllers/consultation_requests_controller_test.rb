require "test_helper"

class ConsultationRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consultation_request = consultation_requests(:one)
  end

  test 'should get index' do
    get consultation_requests_url
    assert_response :success
  end

  test 'should create consultation_request' do
    patient = patients(:one)
    valid_request = { consultation_request: { patient_id: patient.id, text: 'Sample request text' } }

    assert_difference('ConsultationRequest.count') do
      post consultation_requests_url, params: valid_request
    end

    assert_response :created
  end

  test 'should not create invalid consultation_request' do
    invalid_request = { consultation_request: { patient_id: nil, text: '' } }

    assert_no_difference('ConsultationRequest.count') do
      post consultation_requests_url, params: invalid_request
    end

    assert_response :unprocessable_entity
  end
end
