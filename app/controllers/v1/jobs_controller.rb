module V1
    class JobsController < ApplicationController
        def create
            job = Job.new(job_params)
            if !job.save
                return render_unprocessable_entity_response job
            end

            render json: {status: 'success', data: job}, status: :ok
        end

        def ranking
            job = Job.find(params[:id])
            applications = job.applications.order("score desc")
            render json: {data: RankingResponse.new.transform(applications)}
        end

        private
        def job_params
            params.permit(:empresa, :titulo, :descricao, :localizacao, :nivel)
        end
    end
end
