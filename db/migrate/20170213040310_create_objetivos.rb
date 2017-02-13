class CreateObjetivos < ActiveRecord::Migration[5.0]
  def change
    create_table :objetivos do |t|
      t.integer :mision_id
      t.string :nombre
      t.string :descripcion
      t.string :urlvideo
      t.text :instructivo
      t.string :urlevaluativo

      t.timestamps
    end
  end
end
