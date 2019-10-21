class Application < ApplicationRecord
    belongs_to :job, foreign_key: :id_vaga
    belongs_to :person, foreign_key: :id_pessoa
    validates_uniqueness_of :id_pessoa, scope: [:id_vaga], :message => 'Candidatura já realizada.'

    def save_score(application)
        score = ScoreService.new

        level = score.calculate_level(application.job.nivel, application.person.nivel)
        distance = score.calculate_distance(application.person.localizacao, application.job.localizacao)
        score = score.calculate_score(level, distance)

        application.score = score
        application.save
        
        return application
    end
end
