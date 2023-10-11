require "test_helper"

class PatientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference("Patient.count") do
      post patients_url, params: { patient: FactoryBot.attributes_for(:patient) }
    end

    assert_response :created
  end

  test "should not create patient with invalid data" do
    assert_no_difference("Patient.count") do
      post patients_url, params: { patient: { full_name: "", date_of_birth: "invalid-date", phone_number: "123", email: "invalid-email" } }
    end

    assert_response :unprocessable_entity
  end
end