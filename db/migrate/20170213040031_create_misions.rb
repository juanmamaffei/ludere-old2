class CreateMisions < ActiveRecord::Migration[5.0]
  def change
    create_table :misions do |t|
      t.string :nombre
      t.string :nivel
      t.text :descripcion
      t.string :urltemario
      t.string :urlimagen
      t.string :comentario
      t.boolean :habilitado
      t.boolean :visible

      t.timestamps
    end
  end
end
