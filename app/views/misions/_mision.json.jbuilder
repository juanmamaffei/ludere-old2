json.extract! mision, :id, :nombre, :nivel, :descripcion, :urltemario, :urlimagen, :comentario, :habilitado, :visible, :created_at, :updated_at
json.url mision_url(mision, format: :json)