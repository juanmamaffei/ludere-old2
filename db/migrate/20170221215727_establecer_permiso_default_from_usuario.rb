class EstablecerPermisoDefaultFromUsuario < ActiveRecord::Migration[5.0]
  def change
  	change_column_default(:usuarios, :permisos, 1)
  end
end
