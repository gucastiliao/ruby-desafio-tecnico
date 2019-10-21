class PersonResponse
    def transform(person, score)
        return {
            nome: person.nome,
            profissao: person.profissao,
            localizacao: person.localizacao.upcase,
            nivel: person.nivel,
            score: score
        }
    end
end
