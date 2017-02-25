json.extract! post, :id, :grupo_id, :usuario_id, :respuesta, :contenido, :created_at, :updated_at
json.url post_url(post, format: :json)