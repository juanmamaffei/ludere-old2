class CreateEstrellas < ActiveRecord::Migration[5.0]
  def change
    create_table :estrellas do |t|
      t.references :idusuario, foreign_key: true
      t.references :idobjetivo, foreign_key: true
      t.boolean :est1
      t.boolean :est2
      t.boolean :est3

      t.timestamps
    end
  end
end
