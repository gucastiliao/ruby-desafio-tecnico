class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :nome
      t.string :profissao
      t.string :localizacao
      t.integer :nivel

      t.timestamps
    end
  end
end
