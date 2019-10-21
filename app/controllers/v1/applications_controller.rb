module V1
    class ApplicationsController < ApplicationController
        def create
            application = Application.new(application_params)
            if !application.save
                return render_unprocessable_entity_response application
            end

            application = application.save_score(application)
            
            render json: {status: 'success', data: ApplicationResponse.new.transform(application)}, status: :ok
        end

        private
        def application_params
            params.permit(:id_pessoa, :id_vaga)   
        end
    end
end
