json.extract! grupo, :id, :nombre, :descripcion, :integrantes, :misiones, :administradores, :abierto, :created_at, :updated_at
json.url grupo_url(grupo, format: :json)