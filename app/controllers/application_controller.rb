class ApplicationController < ActionController::API
    def render_unprocessable_entity_response(resource)
        render json: {status: 'error', errors: resource.errors}, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotFound do
        render json: {status: 'error', errors: { resource: "Não existe." }}, status: :not_found
    end
end