class ApplicationsResponse
    def transform(application)
        return {
            id: application.id,
            vaga: application.job,
            pessoa: application.person,
            score: application.score,
            created_at: application.created_at,
            updated_at: application.updated_at
        }
    end
end
