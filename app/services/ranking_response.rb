class RankingResponse
    def transform(applications)
        people = []

        applications.each do |application|
            people.push(PeopleResponse.new.transform(application.person, application.score))
        end

        return people
    end
end
