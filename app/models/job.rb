class Job < ApplicationRecord
    validates_presence_of :empresa, :message => 'Preencha este campo.'
    validates_presence_of :titulo, :message => 'Preencha este campo.'
    validates_presence_of :descricao, :message => 'Preencha este campo.'
    validates_presence_of :localizacao, :message => 'Preencha este campo.'
    validates_presence_of :nivel, :message => 'Preencha este campo.'
    validates :nivel, :level_format => true
    validates :localizacao, :location_format => true

    has_many :applications, foreign_key: :id_vaga
end
