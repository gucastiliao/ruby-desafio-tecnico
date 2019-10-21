require 'test_helper'

class JobsTest < ActionDispatch::IntegrationTest
    test "can create job" do
        post "/v1/vagas",
        params: { empresa: "Teste2", titulo: "Vaga teste", descricao: "Criar os mais diferentes tipos de teste", localizacao: "A", nivel: 5 }
        json_response = JSON.parse(response.body)
        
        assert_response :success
        assert_equal "Teste2", json_response["data"]["empresa"]
    end

    test "can create job with invalid fields" do
        post "/v1/vagas",
        params: { empresa: "Teste2", titulo: "Vaga teste" }
        
        assert_response :unprocessable_entity
    end

    test "can create job with invalid location and level" do
        post "/v1/vagas",
        params: { empresa: "Teste2", titulo: "Vaga teste", descricao: "Criar os mais diferentes tipos de teste", localizacao: "Z", nivel: 10 }
        json_response = JSON.parse(response.body)

        assert_response :unprocessable_entity
        assert_not_nil json_response["errors"]["localizacao"]
        assert_not_nil json_response["errors"]["nivel"]
    end

    test "get ranking with applications and scores" do
        get "/v1/vagas/#{jobs(:job_nivel_5).id}/candidaturas/ranking"
        json_response = JSON.parse(response.body)
        
        assert_response :success
        assert_equal 100, json_response["data"][0]["score"]
        assert_equal 50, json_response["data"][1]["score"]
    end
end
