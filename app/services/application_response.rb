class ApplicationResponse
    def transform(application)
        return {
            id: application.id,
            vaga: JobResponse.new.transform(application.job),
            pessoa: PersonResponse.new.transform(application.person, application.score),
            created_at: application.created_at,
            updated_at: application.updated_at
        }
    end
end
