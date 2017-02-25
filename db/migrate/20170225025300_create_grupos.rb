class CreateGrupos < ActiveRecord::Migration[5.0]
  def change
    create_table :grupos do |t|
      t.string :nombre
      t.text :descripcion
      t.text :integrantes
      t.text :misiones
      t.text :administradores
      t.boolean :abierto

      t.timestamps
    end
  end
end
