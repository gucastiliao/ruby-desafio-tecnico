Rails.application.routes.draw do
    namespace 'v1' do
        resources :jobs, path: '/vagas' do
            member do
                get '/candidaturas/ranking', to: 'jobs#ranking'
            end
        end
        
        resources :people, path: '/pessoas'
        resources :applications, path: '/candidaturas'
    end
end
