class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :empresa
      t.string :titulo
      t.text :descricao
      t.string :localizacao
      t.integer :nivel

      t.timestamps
    end
  end
end
