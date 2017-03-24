class CreateTableros < ActiveRecord::Migration[5.0]
  def change
    create_table :tableros do |t|
      t.string :nombre
      t.text :descripcion
      t.datetime :horainicio
      t.datetime :horafin
      t.boolean :puntos
      t.boolean :abierto
      t.text :e1
      t.text :e2
      t.text :e3
      t.text :miembros
      t.datetime :cronometro

      t.timestamps
    end
  end
end
