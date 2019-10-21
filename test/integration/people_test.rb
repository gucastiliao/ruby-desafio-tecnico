require 'test_helper'

class PeopleTest < ActionDispatch::IntegrationTest
    test "can create person" do
        post "/v1/pessoas",
        params: { nome: "John Doez", profissao: "Engenheiro de Software", localizacao: "A", nivel: 5 }
        json_response = JSON.parse(response.body)
       
        assert_response :success
        assert_equal "John Doez", json_response["data"]["nome"]
    end

    test "can create person with invalid fields" do
        post "/v1/pessoas",
        params: { nome: "John Doez", profissao: "Engenheiro de Software" }
        
        assert_response :unprocessable_entity
    end
end
