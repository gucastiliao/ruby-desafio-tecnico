module V1
    class PeopleController < ApplicationController
        def create
            person = Person.new(person_params)
            if !person.save
                return render_unprocessable_entity_response person
            end
            
            render json: {status: 'success', data: person}, status: :created
        end

        private
        def person_params
            params.permit(:nome, :profissao, :localizacao, :nivel)
        end
    end
end
