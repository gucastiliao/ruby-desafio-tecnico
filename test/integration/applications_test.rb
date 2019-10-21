require 'test_helper'

class ApplicationsTest < ActionDispatch::IntegrationTest
    test "can create application" do
        post "/v1/candidaturas",
        params: { id_pessoa: people(:person_level_5).id, id_vaga: jobs(:job_nivel_5).id }
        json_response = JSON.parse(response.body)
       
        assert_response :success
        assert_equal people(:person_level_5).id, json_response["data"]["pessoa"]["id"]
        assert_equal jobs(:job_nivel_5).id, json_response["data"]["vaga"]["id"]
    end

    test "can duplicate applications" do
        post "/v1/candidaturas",
        params: { id_pessoa: people(:person_level_5).id, id_vaga: jobs(:job_nivel_5).id }
        post "/v1/candidaturas",
        params: { id_pessoa: people(:person_level_5).id, id_vaga: jobs(:job_nivel_5).id }
        
        assert_response :unprocessable_entity
    end

    test "can create application and generate score with value 75" do
        post "/v1/candidaturas",
        params: { id_pessoa: people(:person_level_5).id, id_vaga: jobs(:job_nivel_5).id }
        json_response = JSON.parse(response.body)
        
        assert_response :success
        assert_equal people(:person_level_5).id, json_response["data"]["pessoa"]["id"]
        assert_equal jobs(:job_nivel_5).id, json_response["data"]["vaga"]["id"]
        assert_equal 75, json_response["data"]["score"]
    end

    test "can create application and generate score with value 50" do
        post "/v1/candidaturas",
        params: { id_pessoa: people(:person_level_3).id, id_vaga: jobs(:job_nivel_5).id }
        json_response = JSON.parse(response.body)
        
        assert_response :success
        assert_equal people(:person_level_3).id, json_response["data"]["pessoa"]["id"]
        assert_equal jobs(:job_nivel_5).id, json_response["data"]["vaga"]["id"]
        assert_equal 50, json_response["data"]["score"]
    end
end
