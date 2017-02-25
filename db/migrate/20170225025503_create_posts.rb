class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :grupo, foreign_key: true
      t.references :usuario, foreign_key: true
      t.integer :respuesta
      t.text :contenido

      t.timestamps
    end
  end
end
