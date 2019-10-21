class JobResponse
    def transform(job)
        return {
            id: job.id,
            empresa: job.empresa,
            titulo: job.titulo,
            descricao: job.descricao,
            localizacao: job.localizacao.upcase,
            nivel: job.nivel,
            created_at: job.created_at,
            updated_at: job.updated_at
        }
    end
end
