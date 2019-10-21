class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.integer :id_vaga, null: false
      t.integer :id_pessoa, null: false
      t.integer :score, null: true

      t.timestamps
    end

    add_foreign_key :applications, :jobs, column: :id_vaga
    add_foreign_key :applications, :people, column: :id_pessoa
  end
end
