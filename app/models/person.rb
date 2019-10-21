class Person < ApplicationRecord
    validates_presence_of :nome, :message => 'Preencha este campo.'
    validates_presence_of :profissao, :message => 'Preencha este campo.'
    validates_presence_of :localizacao, :message => 'Preencha este campo.'
    validates_presence_of :nivel, :message => 'Preencha este campo.'
    validates :nivel, :level_format => true
    validates :localizacao, :location_format => true

    has_many :applications, foreign_key: :id_pessoa
end
