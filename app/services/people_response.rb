class PeopleResponse
    def transform(person, score)
        return {
            nome: person.nome,
            profissao: person.profissao,
            localizacao: person.localizacao,
            nivel: person.nivel,
            score: score
        }
    end
end
